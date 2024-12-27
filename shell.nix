{
  pkgs ? import <nixpkgs> {}
}:
let
    pythonPackages = with pkgs.python3Packages; [
        pytest
        pytest-asyncio
        pytest-timeout
        pytest-xdist
        psycopg
        filelock
	contextlib2
  	black
  	flake8
  	flake8-bugbear
  	isort
    ];
in pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = [
        pkgs.pkg-config
    ];
    buildInputs = [
        pkgs.libevent
        pkgs.openssl
        pkgs.c-ares
        pkgs.systemd
        pkgs.python3
        pkgs.libtool
        pkgs.automake
        pkgs.pam
        pythonPackages
    ];
}
