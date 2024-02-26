{ stdenv, fetchgit, lib, cmake, ffmpeg, SDL2, SDL2_ttf }:

stdenv.mkDerivation rec {
  pname = "ascii_player";
  version = "0.1.0";

  src = fetchgit {
    url = "https://github.com/Ferios/ascii_player.git";
    rev = "c6d905d6ec4bdde7b82c538fcb8008c74765aefc";
    sha256 = "sha256-PD84auZQU1crpyUJy2k7UNzKP1JwmKiucv13k1taOAs=";
  };

  buildInputs = [
    cmake
    ffmpeg
    SDL2_ttf
    SDL2
  ];

  configurePhase = ''
    cmake .
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv ascii_player $out/bin
    cp resources/SpaceMono-Regular.ttf $out/bin
    cp resources/BadApple.mp4 $out/bin
  '';
}
