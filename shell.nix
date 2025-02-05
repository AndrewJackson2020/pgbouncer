{
  pkgs ? import <nixpkgs> {}
}:
let
    pythonPackages = with pkgs.python311Packages; [
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
        pkgs.cmake
        pkgs.gcc
    ];
    buildInputs = [
	pkgs.cirrus-cli
        pkgs.automake
        pkgs.autoconf
        pkgs.c-ares
        pkgs.curl
        pkgs.cacert
        pkgs.libevent
        pkgs.libtool
        pkgs.openssl
        pkgs.uncrustify
        pkgs.pam
        pkgs.which
        pkgs.git
        pkgs.postgresql
        pkgs.python311
        pkgs.systemd
        pkgs.valgrind
        pythonPackages
    ];
    shellHook = ''
        cp ${pkgs.uncrustify}/bin/uncrustify ./uncrustify
    '';
}
