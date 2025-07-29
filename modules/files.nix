{ user, config, pkgs, ... }:

let
  xdg_configHome = "${config.users.users.${user}.home}/.config";
  xdg_dataHome   = "${config.users.users.${user}.home}/.local/share";
  xdg_stateHome  = "${config.users.users.${user}.home}/.local/state"; in
{
  ".config/starship.toml" = {
    text = builtins.readFile ./starship/starship.toml;
  };

  ".config/sketchybar/sketchybarrc" = {
    text = builtins.readFile ./sketchybar/sketchybarrc;
    executable = true;
  };

  ".config/sketchybar/plugins/battery.sh" = {
    text = builtins.readFile ./sketchybar/plugins/battery.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/clock.sh" = {
    text = builtins.readFile ./sketchybar/plugins/clock.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/front_app.sh" = {
    text = builtins.readFile ./sketchybar/plugins/front_app.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/space.sh" = {
    text = builtins.readFile ./sketchybar/plugins/space.sh;
    executable = true;
  };

  ".config/sketchybar/plugins/volume.sh" = {
    text = builtins.readFile ./sketchybar/plugins/volume.sh;
    executable = true;
  };
}