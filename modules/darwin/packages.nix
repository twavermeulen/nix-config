{ pkgs }:

with pkgs; [
  # General packages for development and system management
  kitty
  dockutil
  
  # Text and terminal utilities
  starship
  nerd-fonts.jetbrains-mono

  # Add any other packages that were in shared/packages.nix
]
