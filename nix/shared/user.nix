{ pkgs, ... }: {
  user = {
    description = "Gregory Hapgood";
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
