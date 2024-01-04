{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "athena-config";
  version = "unstable-2024-01-04";

  src = fetchFromGitHub {
    owner = "Athena-OS";
    repo = "athena-config";
    rev = "66d915ea32c76563611c0a8ee0d8edb1b86dc9ed";
    hash = "sha256-7ZTgnITWr1GB6UKwli3Smr/gVsJsfWBAdFv1YBr0mE0=";
  };

  installPhase = ''
    mkdir -p $out/{bin,share}
    cp -r bin/* $out/bin/
    cp -r share/* $out/share/
  '';

  meta = with lib; {
    description = "Athena OS environment files";
    mainProgram = "athena-config";
    homepage = "https://github.com/Athena-OS/athena-config";
    maintainers = with maintainers; [ d3vil0p3r ];
    platforms = platforms.unix;
    license = licenses.gpl3;
  };
})