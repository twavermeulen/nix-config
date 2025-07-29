{ user, config, pkgs, ... }:

let
  xdg_configHome = "${config.users.users.${user}.home}/.config";
  xdg_dataHome   = "${config.users.users.${user}.home}/.local/share";
  xdg_stateHome  = "${config.users.users.${user}.home}/.local/state"; 
in
{
  ".config/starship.toml" = {
    text = builtins.readFile ./files/starship/starship.toml;
  };
  
   ".config/kitty/gruvbox_dark.conf" = {
      text = builtins.readFile ./files/kitty/gruvbox_dark.conf;
   };

  ".config/sketchybar/sketchybarrc" = {
    text = builtins.readFile ./files/sketchybar/sketchybarrc;
    executable = true;
  };

  ".config/sketchybar/plugins/battery.sh" = {
    text = builtins.readFile ./files/sketchybar/plugins/battery.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/clock.sh" = {
    text = builtins.readFile ./files/sketchybar/plugins/clock.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/front_app.sh" = {
    text = builtins.readFile ./files/sketchybar/plugins/front_app.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/space.sh" = {
    text = builtins.readFile ./files/sketchybar/plugins/space.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/volume.sh" = {
    text = builtins.readFile ./files/sketchybar/plugins/volume.sh;
    executable = true;
  };
}