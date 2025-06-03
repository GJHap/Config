{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in with pkgs; {
      devShells.x86_64-linux.default = mkShell {
        buildInputs =
          [ efm-langserver go gopls lua-language-server nixd nixfmt stylua ];
      };
    };
}
