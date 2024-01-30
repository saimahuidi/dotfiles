#!/usr/bin/env nu
print "===start update dotfiles==="
let dotfile_pos = "/home/geoffrey/projects/tools/dotfiles/"
let config_pos = "/home/geoffrey/.config/"
if ($"($dotfile_pos)/.config" | path exists) {
  rm -r $"($dotfile_pos)/.config"
}
cp -r $config_pos $dotfile_pos
cd $dotfile_pos
git add *
git commit -m"update .config"
git push
