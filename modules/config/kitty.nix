{ pkgs, config, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    extraConfig = ''
        include ./gruvbox_dark.conf
      '';
  };
}