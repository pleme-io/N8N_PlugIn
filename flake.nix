{
  description = "n8n community node for Akeyless Secrets Management integration with API Key authentication";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.default = pkgs.buildNpmPackage {
        pname = "n8n-nodes-akeyless";
        version = "0.0.0-dev";
        src = self;
        sourceRoot = "source/n8n-nodes-akeyless";
        npmDepsHash = "sha256-i7qJKvYzYdVm/ZpWW9iM9Ica65NV1PegEDDkmoSM9Mc=";
        dontNpmBuild = false;
        npmBuildScript = "build";
        meta = {
          description = "n8n community node for Akeyless Secrets Management integration with API Key authentication";
          homepage = "https://github.com/pleme-io/N8N_PlugIn";
          license = pkgs.lib.licenses.mit;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
