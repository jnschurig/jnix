{ config, pkgs, ... }: {
  programs.tmux = {
    enable = false;
    shortcut = "a";
    clock24 = false;
    newSession = true;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = builtins.readFile ./tmux/tmux.conf;
  };
}
