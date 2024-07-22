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
    
    nix-gaming.url = "github:fufexan/nix-gaming";
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sddm-sugar-candy-nix = {
    #   url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
    #   # Optional, by default this flake follows nixpkgs-unstable.
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };


    # polymc.url = "github:PolyMC/PolyMC";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

    # nixos - system hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
        inputs.nixvim.nixosModules.nixvim
        inputs.nix-gaming.nixosModules.pipewireLowLatency
        # inputs.sddm-sugar-candy-nix.nixosModules.default
        # {
        #   nixpkgs = {
        #     overlays = [
        #       inputs.sddm-sugar-candy-nix.overlays.default
        #     ];
        #   };
        # }
      ];
    };

    homeConfigurations.james = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home-manager/home.nix ];
    };
  };
}
