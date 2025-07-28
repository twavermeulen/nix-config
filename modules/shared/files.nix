{ pkgs, config, ... }:

{
  # Initializes Emacs with org-mode so we can tangle the main config

  # IMPORTANT: The Emacs configuration expects a config.org file at ~/.config/emacs/config.org
  # You can either:
  # 1. Copy the provided config.org to ~/.config/emacs/config.org
  # 2. Set EMACS_CONFIG_ORG environment variable to point to your config.org location
  # 3. Uncomment below to have Nix manage the file:
  #
  # ".config/emacs/config.org" = {
  #   text = builtins.readFile ../shared/config/emacs/config.org;
  # };

  ".config/starship.toml" = {
    text = builtins.readFile ./config/starship.toml;
  };

  ".config/sketchybar/sketchybarrc" = {
    text = builtins.readFile ./config/sketchybar/sketchybarrc;
    executable = true;
  };

  ".config/sketchybar/plugins/battery.sh" = {
    text = builtins.readFile ./config/sketchybar/plugins/battery.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/clock.sh" = {
    text = builtins.readFile ./config/sketchybar/plugins/clock.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/front_app.sh" = {
    text = builtins.readFile ./config/sketchybar/plugins/front_app.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/space.sh" = {
    text = builtins.readFile ./config/sketchybar/plugins/space.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/volume.sh" = {
    text = builtins.readFile ./config/sketchybar/plugins/volume.sh;
    executable = true;
  };
}