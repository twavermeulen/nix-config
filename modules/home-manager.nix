{ config, pkgs, lib, home-manager, ... }:

let
  user = "thomas";
  name = "thomas";
  email = "twa.vermeulen@student.avans.nl";
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in
{
  imports = [
   ./config/dock.nix
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix {};
    brews = pkgs.callPackage ./brews.nix {};
    masApps = import ./masApps.nix;
    
#    onActivation.cleanup = "uninstall";
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:{
      imports = [
        ./config/kitty.nix
        ./config/starship.nix
        ./config/zsh.nix
        ./config/git.nix
      ];

      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        file = additionalFiles;
        stateVersion = "23.11";
      };

      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock = {
    enable = true;
    username = user;
    entries = [
      { path = "/Applications/Brave Browser.app/"; }
      { path = "/Applications/Discord.app/"; }
      { path = "/Applications/Microsoft Outlook.app/"; }
      { path = "/Applications/Rider.app/"; }
      { path = "/Applications/Docker.app/"; }
    ];
  };
}