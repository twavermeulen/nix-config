{ pkgs }:

with pkgs; [
  # General packages for development and system management
  kitty
  dockutil
  nerd-fonts.hack
  
  # Text and terminal utilities
  starship
  nerd-fonts.jetbrains-mono

  # Add any other packages that were in shared/packages.nix
]
