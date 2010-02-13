src 'sphinx' do
  requires 'build tools'
  provides 'search'
  prefix '/opt/local'
  configure_args '--with-pgsql'
  source "http://www.sphinxsearch.com/downloads/sphinx-0.9.9.tar.gz"
end


