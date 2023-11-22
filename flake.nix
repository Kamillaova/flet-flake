{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";
		systems.url = "github:nix-systems/default";
	};

	outputs = inputs @ { flake-parts, ... }: 
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = import inputs.systems;

			perSystem = { self', pkgs, ... }: let
				python = pkgs.python3;
				callPackage = python.pkgs.callPackage;
			in {
				packages = rec {
					flet-core = callPackage ./pkgs/flet-core {};
					flet-runtime = callPackage ./pkgs/flet-runtime { inherit flet-core; };
					flet = callPackage ./pkgs/flet { inherit flet-core flet-runtime; };
				};

				devShells = rec {
					flet = (python.withPackages (_: [ self'.packages.flet ])).env;
					default = flet;
				};
			};
		};
}
