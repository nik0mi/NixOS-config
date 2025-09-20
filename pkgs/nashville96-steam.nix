{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "nashville96-steam";
  version = "v1.3.1";

  src = fetchFromGitHub {
    owner = "donfaustinocortizone";
    repo = "Nashville96";
    https://github.com/donfaustinocortizone/Nashville96/releases/tag/v1.3.1
    rev = "bce1c842d9066f9d6d64a53e9727a6af91c2178e";
    hash = "sha256-aRX+bvdrrtmCCNLCThXCCohLWM/AfZG7F/EXcc+iNMA="; 
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r Nashville96-Steam* $out/share/themes/
  '';
}
