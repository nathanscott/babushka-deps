dep 'osx monitor fonts' do
  shell "defaults -currentHost write -globalDomain AppleFontSmoothing -int 2"
end

dep 'show Library dir' do
  shell "chflags nohidden ~/Library/"
end

dep 'enable key repeat' do
  shell "defaults write -g ApplePressAndHoldEnabled -bool false"
end

dep 'disable spell correction' do
  shell "defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool NO"
end