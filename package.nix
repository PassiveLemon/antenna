{ lib
, stdenv
, lua
, openssh
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "antenna";
  version = "0.1.0";

  src = ./.;

  strictDeps = true;

  buildInputs = [
    lua
    openssh
  ];

  meta = with lib; {
    description = "Run FFmpeg commands on another host, entirely over SSH";
    homepage = "https://github.com/PassiveLemon/antenna";
    changelog = "https://github.com/PassiveLemon/antenna/releases/tag/${finalAttrs.version}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "antenna";
  };
})

