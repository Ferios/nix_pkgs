{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "ascii_player";
  version = "0.1.1";

  src = pkgs.fetchgit {
    url = "https://github.com/Ferios/ascii_player.git";
    rev = "6f63b6f9665b58144b69e460f78ca511eaedc8ac";
    sha256 = "sha256-+/MN7UK6S7ZKM1dRfjxiji0H5gGRVdJC3N0ui/gy5KY=";
  };

  buildInputs = [
    pkgs.cmake
    pkgs.ffmpeg
    pkgs.SDL2_ttf
    pkgs.SDL2
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

  meta = with pkgs.lib; {
    description = "A basic video-to-ascii player";
    longDescription = ''
      Video player that uses FFmpeg and SDL to play video files
      as ASCII-art.
      Cd to 'ascii_player' directory and execute with a video
      file (BadApple.mp4 is provided as a reference).
    '';
    homepage = "https://github.com/Ferios/ascii_player";
    maintainers = with maintainers; [ Ferios ];
    mainProgram = "ascii_player";
  };
}

