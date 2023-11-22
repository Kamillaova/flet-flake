{ lib
, buildPythonPackage
, fetchPypi

# build-system
, poetry-core

# propagates
, flet-core
, httpx
, oauthlib
, typing-extensions
}:

buildPythonPackage rec {
	pname = "flet-runtime";
	version = "0.12.2";
	format = "pyproject";

	src = fetchPypi {
		pname = "flet_runtime";
		inherit version;
		hash = "sha256-luPZzBysLf+SgzxrspR/i/hV6Xsth2SG4Z4PFM/NlnI=";
	};

	nativeBuildInputs = [ poetry-core ];

	propagatedBuildInputs = [
		flet-core
		typing-extensions
		oauthlib
		httpx
	];

	pythonImportsCheck = [ "flet_runtime" ];

	meta = {
		description = "Flet Runtime - a base package for Flet desktop and Flet mobile.";
		homepage = "https://flet.dev";
		changelog = "https://github.com/flet-dev/flet/releases/tag/v${version}";
		license = lib.licenses.asl20;
	};
}
