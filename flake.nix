{
inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  zen-browser.url = "github:0xc000022070/zen-browser-flake";
};

outputs = { self, nixpkgs, zen-browser, ...}@inputs: {
  nixosConfigurations.andrey = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux"; 
    specialArgs = { inherit inputs; };
    modules = [
       ./configuration.nix
       {
        environment.systemPackages = [
          zen-browser.packages."x86_64-linux".default
     ];
    }
   ];
  };
 };
}
