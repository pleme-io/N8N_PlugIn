{
  description = "n8n community node for Akeyless Secrets Management integration with API Key authentication";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = { url = "github:pleme-io/substrate"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    builder = "package";
    pname = "n8n-nodes-akeyless";
    npmDepsHash = "sha256-i7qJKvYzYdVm/ZpWW9iM9Ica65NV1PegEDDkmoSM9Mc=";
    dontNpmBuild = false;
    npmBuildScript = "build";
    sourceRoot = "source/n8n-nodes-akeyless";
    description = "n8n community node for Akeyless Secrets Management integration with API Key authentication";
  };
}
