{
  description = "JNix - NixOS Configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      # backupFileExtension = "hm-backup"; # This doesn't seem to work...
    };
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nixvim,
     ... 
  } @inputs:

    let
      system = "x86_64-linux";
    in {
    
    # Enable Flakes
    nixSettings = {
      experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes
    };

    homeConfigurations.james = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./home-manager/home.nix
        nixvim.homeManagerModules.nixvim
      ];
    };
  };
}
