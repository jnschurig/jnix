{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.james = {
      isNormalUser = true;
      description = "James Schurig";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
      #  thunderbird
      ];
    };
  };


  # Enable automatic login for the user.
  # services.getty.autologinUser = "james";
}