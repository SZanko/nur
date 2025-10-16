{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "jakym";
  version = "0.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "themayankjha";
    repo = "JAKYM";
    rev = version;
    hash = "sha256-ob/kf4pNETYHBBy8AshAEPWyhy5hUCbXEGfGJpGzqFg=";
  };

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [
    "jakym"
  ];

  propagatedBuildInputs = with python3.pkgs; [
    yt-dlp
    pyfiglet
    requests
    pydub
    termcolor
    beautifulsoup4
    colorama
    lxml
  ];

  meta = {
    description = "JAKYM, Just Another Konsole YouTube-Music. A command line based Youtube music player written in Python with both Spotify and Youtube playlist support and easy on memory. See README for installation instructions";
    homepage = "https://github.com/themayankjha/JAKYM";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ szanko ];
    mainProgram = "jakym";
    platforms = lib.platforms.all;
  };
}
