dep 'worker' do
  requires [
    'benhoskings:user setup',
    'core software',
    'LaunchBar.app',
    'benhoskings:Cinch.app',
    'Dropbox.app',
    'benhoskings:Skitch.app',
    'xaviershay:Skype.app',
    'benhoskings:Transmit.app',
    'benhoskings:Airfoil.app',
    'benhoskings:SizeUp.app',
    'iTerm.app',
    'benhoskings:pg.gem',
    'osx monitor fonts',
    'show Library dir',
    'enable key repeat',
    'disable spell correction'
  ]
end

dep 'core software' do
  requires {
    on :linux, 'vim.managed', 'curl.managed', 'htop.managed', 'jnettop.managed', 'screen.managed', 'nmap.managed', 'tree.managed'
    on :osx, 'curl.managed', 'benhoskings:jnettop.managed', 'benhoskings:nmap.managed', 'benhoskings:tree.managed'
  }
end