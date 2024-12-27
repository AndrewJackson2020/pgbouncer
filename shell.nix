{
  pkgs ? import <nixpkgs> {}
}:
let
    pythonPackages = with pkgs.python39Packages; [
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
	pkgs.cirrus-cli
        pkgs.automake
        pkgs.c-ares
        pkgs.libevent
        pkgs.libtool
        pkgs.openssl
        pkgs.pam
        pkgs.postgresql
        pkgs.python39
        pkgs.systemd
        pkgs.valgrind
        pythonPackages
    ];
}
