{
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, home-manager, mac-app-util, neovim-nightly-overlay
    , nix-darwin, nixpkgs }:
    let
      buildSystem =
        { basePath, extraModules, systemFn, system, hmFn, hmExtraModules }:
        let username = import shared/username.nix { };
        in systemFn {
          inherit system;
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ neovim-nightly-overlay.overlays.default ];
            config.allowUnfree = true;
          };
          modules = [
            "${self}/${basePath}/system/configuration.nix"
            hmFn
            {
              home-manager = {
                sharedModules = [ ] ++ hmExtraModules;
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import "${self}/${basePath}/home-manager";
              };
            }
          ] ++ extraModules;
        };
    in {
      darwinConfigurations = {
        darwin = buildSystem {
          basePath = "Darwin";
          extraModules = [ mac-app-util.darwinModules.default ];
          systemFn = nix-darwin.lib.darwinSystem;
          system = "aarch64-darwin";
          hmFn = home-manager.darwinModules.home-manager;
          hmExtraModules = [ mac-app-util.homeManagerModules.default ];
        };
      };
      nixosConfigurations = {
        nixos = buildSystem {
          basePath = "NixOS";
          extraModules = [ ];
          systemFn = nixpkgs.lib.nixosSystem;
          system = "x86_64-linux";
          hmFn = home-manager.nixosModules.home-manager;
          hmExtraModules = [ ];
        };
      };
    };
}
