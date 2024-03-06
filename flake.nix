{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs = inputs@{ flake-parts, ...}:
    flake-parts.lib.mkFlake { inherit inputs; }{
      imports = [
        inputs.treefmt-nix.flakeModule
      ];      
      flake = {
        
      };
      systems = [
        "x86_64-linux"
      ];
      perSystem = { config, ...}:{
        
      };
    };
}
