{
  # zsh management
  refreshzsh = "source $(readlink -f ~/.zshrc)";
  catzsh = "bat $(readlink -f ~/.zshrc)";
  # openzshrc = "vsc ~/.zshrc";
  # openzshrcv = "vim ~/.zshrc";

  # general
  grep = "grep --color";
  t = "tail -f";
  # vsc = "code-insiders";
  sshfingerprint = "ssh-keygen -l -E md5 -f ";
  wcl = "wc -l ./* | sort -nr";
  c = "clear";
  q = "exit";
  quit = "exit";
  ".." = "cd .. 2>/dev/null || cd \"$(dirname $PWD)\""; # Allows leaving from deleted directories
  cat = "bat";

  # git
  lg = "lazygit";

  # vim
  v = "vim";

  # fzf
  vf = "fzf --print0 | xargs -0 -o vim";
  vc = "fzf --print0 | xargs -0 -o vim";
  # Open the file in Vim and go to the line
  vl = "git grep --line-number . | fzf --delimiter : --nth 3.. --bind 'enter:become(vim {1} +{2})'";
  cdf = "cd $(fd --type d | fzf)";
  cdh = "cd $(fd . \"$HOME\"  --type d | fzf)";

  # ripgrep
  # bg = "batgrep";
  # bdiff = "batdiff";

  # eza
  # ls = "eza --group-directories-first --git-ignore";
  # l = "ls -1";
  # la = "l -a";
  # lsa = "ls -alh";
  # ll = "ls -alh --git";
  # llg = "ll --grid";
  # lt = "ls -T";
  # llt = "ll -T";
  # dirsize = "du -sh * | sort -nr";
  # lsize = "eza --group-directories-first -alh -s = size";

  # updatels = ''ls="eza --group-directories-first"'';
  # updatels = ''
  #   ls="eza --group-directories-first"
  #   l="ls -1"
  #   la="l -a"
  #   ll="ls -lh --git"
  #   llg="ll --grid"
  #   lt="ls -T"
  #   llt="ll -T"
  # '';

  # tmux
  tl = "tmux ls";
  ta = "tmux a -t";
  tnew = "tmux new -s";
  tkill = "tmux kill-session -t";
  tkillall = "tmux kill-session -a";

  # python
  py = "python3";
  pip = "py -m pip";
  changepython3version = "sudo update-alternatives --config python3";
  # pyenv_fetch = "ln -s $(brew --cellar)/python*/* ~/.pyenv/versions/";
  rmvenv = "pyenv virtual-env delete";
  pexit = "source deactivate";
  # pdb = "python -m debugpy";
  # ipy = "pip3 install ipython &> /dev/null && python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'";

  # poetry
  # pshell = "poetry shell";
  # pupdate = "poetry update";
  # pinstall = "poetry install";
  # penv3_9 = "poetry env use /usr/local/opt/python@3.9/bin/python3.9 && pinstall && pshell";
  # penv3_8 = "poetry env use /usr/local/opt/python@3.8/bin/python3.8 && pinstall && pshell";
  # padd = "poetry add";
  # prem = "poetry remove";
  # prun = "poetry run";
  # pinfo = "poetry env info";
  # pls = "poetry env list";
  # prmvenv = "rm -rf .venv' #'poetry env remove";

  # docker / kube
  # dc = "docker compose";
}
