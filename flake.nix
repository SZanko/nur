{
  description = "SZanko's NUR repository";
  inputs = {
    nixpkgs-2311.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-2411.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-2311, nixpkgs-2411 }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      legacyPackages = forAllSystems (system: 
        let
          pkgs = import nixpkgs { inherit system; };
          pkgsUnstable = import nixpkgs-unstable { inherit system; };
          pkgs2311 = import nixpkgs-2311 { inherit system; };
          pkgs2411 = import nixpkgs-2411 { inherit system; };
        in
          import ./default.nix {
            inherit pkgs;
            pkgs2311 = pkgs2311;
            pkgs2411 = pkgs2411;
            pkgsUnstable = pkgsUnstable;
      });
      packages = forAllSystems (system: nixpkgs.lib.filterAttrs (_: v: nixpkgs.lib.isDerivation v) self.legacyPackages.${system});
    };
}
