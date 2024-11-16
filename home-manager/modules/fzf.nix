{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
      changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
      # changeDirWidgetOptions = [ # THIS CAUSES AN ERROR BECAUSE OF THE COLOR OPTION
      #   ''--preview "bat --color=always --style=numbers --line-range=:500 {}"''
      # ];
  };
}