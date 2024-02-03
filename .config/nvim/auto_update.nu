#!/usr/bin/env nu
let nightly_address = "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz";
do {
  if ("/home/geoffrey/softwares/nvim-linux64/" | path exists) {
    rm -r /home/geoffrey/softwares/nvim-linux64/
  }
  if ("/home/geoffrey/downloads/nvim-linux64/" | path exists) {
    rm -r /home/geoffrey/downloads/nvim-linux64/
  }
  cd /home/geoffrey/downloads/
  print "=======start download nvim nightly"
  wget $"($nightly_address)"
  print "=======start extract nvim nightly"
  tar xvf nvim-linux64.tar.gz --directory=../softwares/
}
