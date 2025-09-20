{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "nashville96-steam";
  version = "unstable-2023-09-20";  # Use the date of the latest commit

  src = fetchFromGitHub {
    owner = "donfaustinocortizone";
    repo = "Nashville96";
    rev = "bce1c842d9066f9d6d64a53e9727a6af91c2178e";  # Replace with the latest commit hash
    hash = "sha256-aRX+bvdrrtmCCNLCThXCCohLWM/AfZG7F/EXcc+iNMA=";  # Replace with the correct SHA256 hash
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r "Nashville96-Steam" $out/share/themes/
  '';
}
