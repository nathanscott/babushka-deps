dep 'osx fonts' do
  shell "defaults -currentHost write -globalDomain AppleFontSmoothing -int 2"
end