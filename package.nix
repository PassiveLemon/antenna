{ lib
, stdenv
, lua
, makeWrapper
}:
let
  luaEnv = lua.withPackages (ps: with ps; ([
    luaposix
  ]));
in
stdenv.mkDerivation (finalAttrs: {
  pname = "antenna";
  version = "0.2.0";

  src = ./.;

  strictDeps = true;

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ luaEnv ];

  installPhase = ''
    runHook preInstall

    output=$out/lib/lua/${lua.luaversion}/antenna
    mkdir -p $output
    mkdir -p $out/bin

    cp -r $src/src/* $output
    ln -s $output/antenna.lua $out/bin/antenna

    makeWrapper "$out/bin/antenna" "$out/bin/antenna-ffmpeg" \
      --set LUA_PATH "$output/?.lua" \
      --set ANTENNA_MODE "ffmpeg"

    makeWrapper "$out/bin/antenna" "$out/bin/antenna-ffprobe" \
      --set LUA_PATH "$output/?.lua" \
      --set ANTENNA_MODE "ffprobe"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Run FFmpeg commands on another host";
    homepage = "https://github.com/PassiveLemon/antenna";
    changelog = "https://github.com/PassiveLemon/antenna/releases/tag/${finalAttrs.version}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "antenna";
  };
})

