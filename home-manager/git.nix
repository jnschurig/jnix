{ config
, lib
, pkgs
, ...
}: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ~/.gitconfig
  '';

  # home.file."recharge/.gitconfig".text = ''
  #   [user]
  #     email = "james.schurig@rechargeapps.com";
  #     name = "James Schurig"
  # '';

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "James Schurig";
    userEmail = "jnschurig@gmail.com";

    includes = [
      {
        # use diffrent email & name for work
        path = "~/recharge/.gitconfig";
        # userName = "James Schurig";
        # userEmail = "james.schurig@rechargeapps.com";
        condition = "gitdir:~/recharge/";
      }
    ];

    extraConfig = {
      # init.defaultBranch = "master";
      #push.autoSetupRemote = true;
      pull.rebase = true;
      diff.colorMoved = "default";
    };

    delta = {
      enable = true;
      options = {
        # features = "side-by-side gruvbox-dark navigate hyperlinks";
        # hyperlinks-file-link-format = "vscode-insiders://file/{path}:{line}";
        conflictstyle = "diff3";
        interactive = {
          keep-plus-minus-markers = true;
        };
      };
    };

    #aliases = {
    #  gcm = "git checkout master";
    #};
  };
}