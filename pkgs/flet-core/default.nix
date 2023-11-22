{ lib
, buildPythonPackage
, fetchPypi

# build-system
, poetry-core

# propagates
, typing-extensions
, repath
}:

buildPythonPackage rec {
	pname = "flet-core";
	version = "0.12.2";
	format = "pyproject";

	src = fetchPypi {
		pname = "flet_core";
		inherit version;
		hash = "sha256-8FCcO6S9v2MPn2gL54Xp5P9nptMPG2yeknr25Jl7ZFM=";
	};

	nativeBuildInputs = [ poetry-core ];

	propagatedBuildInputs = [
		repath
		typing-extensions
	];

	meta = {
		description = "Flet core library";
		homepage = "https://flet.dev";
		license = lib.licenses.asl20;
	};
}
