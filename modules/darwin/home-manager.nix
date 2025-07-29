{ config, pkgs, lib, home-manager, ... }:

let
  user = "thomas";
  name = "thomas";
  email = "twa.vermeulen@student.avans.nl";
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in
{
  imports = [
   ./dock
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
    brews = [
      "sketchybar"
    ];
    onActivation.cleanup = "zap";

    masApps = {
      # "wireguard" = 1451685025;
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:{
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        file = additionalFiles;
        stateVersion = "23.11";
      };
      
      programs = {
        kitty = {
          enable = true;
          font = {
            name = "JetBrainsMono Nerd Font";
            size = 12;
          };
        };

        starship = {
          enable = true;
          enableZshIntegration = true;
        };

        zsh = {
          enable = true;
          autocd = false;
          plugins = [ ];
          initContent = lib.mkBefore ''
            if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
              . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
              . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
            fi

            # Define variables for directories
            export PATH=$HOME/.pnpm-packages/bin:$HOME/.pnpm-packages:$PATH
            export PATH=$HOME/.npm-packages/bin:$HOME/bin:$PATH
            export PATH=$HOME/.local/share/bin:$PATH

            # Remove history data we don't want to see
            export HISTIGNORE="pwd:ls:cd"

            # nix shortcuts
            shell() {
                nix-shell '<nixpkgs>' -A "$1"
            }

            # Use difftastic, syntax-aware diffing
            alias diff=difft

            # Always color ls and group directories
            alias ls='ls --color=auto'
          '';
        };

        git = {
          enable = true;
          ignores = [ "*.swp" ];
          userName = name;
          userEmail = email;
          lfs = {
            enable = true;
          };
          extraConfig = {
            init.defaultBranch = "main";
            core = {
              editor = "vim";
              autocrlf = "input";
            };
            pull.rebase = true;
            rebase.autoStash = true;
          };
        };
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
      { path = "/Applications/Safari.app/"; }
      { path = "/System/Applications/System Settings.app/"; }
    ];
  };
}