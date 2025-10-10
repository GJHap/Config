{ ... }: {
  imports = [ ../../shared/home-manager ]
    ++ (if builtins.pathExists ./extras.nix then [ ./extras.nix ] else [ ]);
}
