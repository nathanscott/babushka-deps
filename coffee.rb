
dep 'coffeescript.src' do
  requires 'nodejs.src'
  source 'http://github.com/jashkenas/coffee-script/tarball/1.2.0'
  provides 'coffee ~> 1.2.0'

  process_source {
    shell "bin/cake install"
  }
end

dep 'nodejs.src' do
  source 'git://github.com/joyent/node.git'
  provides 'node', 'node-waf'
end