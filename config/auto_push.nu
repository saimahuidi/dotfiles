#!/usr/bin/env nu
print "===start update dotfiles===\n"
let dotfile_pos = "/home/geoffrey/projects/tools/dotfiles/"
let config_pos = "/home/geoffrey/.config/"
if ($"($dotfile_pos)/.config" | path exists) {
  rm -r $"($dotfile_pos)/.config"
}
cp -r $config_pos $dotfile_pos
cd $dotfile_pos
print "===add all changed files===\n"
git add *
print "===commit all changed files===\n"
git commit -m"update .config"
print "===push to github===\n"
git push
