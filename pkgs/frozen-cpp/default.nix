{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "frozen-cpp";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "serge-sans-paille";
    repo = "frozen";
    rev = finalAttrs.version;
    hash = "sha256-checyHMJ+1w1HGkllNEaLO6NykNIjIfuxHXSmAYbDUU=";
  };

  nativeBuildInputs = [
    cmake
  ];

  meta = {
    description = "A header-only, constexpr alternative to gperf for C++14 users";
    homepage = "https://github.com/serge-sans-paille/frozen";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ szanko ];
    mainProgram = "frozen-cpp";
    platforms = lib.platforms.all;
  };
})
