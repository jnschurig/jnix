
{ pkgs
, lib
, ...
}: {
  home.file = {
    ".config/pycodestyle" = {
      source = ./pycodestyle/pycodestyle.toml;
    };
  };

}
