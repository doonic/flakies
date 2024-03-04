{
 description = "Allan's Nixos and Home-Manager configuration flake";

 inputs = {
   # Nixpkgs
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
 
   # Home manager
   home-manager.url = "github:nix-community/home-manager/release-23.11";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";

   # Hardware
   hardware.url = "github:nixos/nixos-hardware";

 };
 
 outputs = inputs@{ nixpkgs, home-manager, ... }: { 
   nixosConfigurations = {
     nixos = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [
         ./nixos/configuration.nix
        
         # make home-manager a module of nixos such that home-manager
         # configuration is deployed automatically when executing `nixos-rebuild swith` 
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;

           home-manager.users.doni = import ./home-manager/home.nix;
         }
       ];
      };
    };
  };
}
