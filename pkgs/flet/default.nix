{ lib
, buildPythonPackage
, fetchPypi

# build-system
, poetry-core

# propagates
, flet-core
, flet-runtime
, httpx
, oauthlib
, packaging
, typing-extensions
, watchdog
, websocket-client
, websockets

# need for bin/flet
, rich
, qrcode
}:

buildPythonPackage rec {
	pname = "flet";
	version = "0.12.2";
	format = "pyproject";

	src = fetchPypi {
		inherit pname version;
		hash = "sha256-gxx7kN8LAAqKw6Woz9iGOLRW5nh6otdniMo5cNdBccM=";
	};

	nativeBuildInputs = [ poetry-core ];

	propagatedBuildInputs = [
		flet-core
		flet-runtime
		typing-extensions
		websocket-client
		watchdog
		oauthlib
		websockets
		httpx
		packaging
		rich
		qrcode
	];

	pythonImportsCheck = [ "flet" ];

	meta = {
		description = "A framework that enables you to easily build realtime web, mobile, and desktop apps in Python";
		homepage = "https://flet.dev";
		changelog = "https://github.com/flet-dev/flet/releases/tag/v${version}";
		license = lib.licenses.asl20;
		mainProgram = "flet";
	};
}
