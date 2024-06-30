{ pkgs, ... }: 

let
  username = "james";
in {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users."${username}" = {
      isNormalUser = true;
      description = "James Schurig";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
      #  thunderbird
      ];
    };

  };

  nix.settings.trusted-users = [username];

  # Enable automatic login for the user.
  # services.getty.autologinUser = "${username}";
}