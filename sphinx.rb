src 'sphinx' do
  requires 'build tools'
  provides 'search'
  define_var :database_support,
    :message => "Which databases would you like sphinx to support?",
    :default => '--with-pgsql --without-mysql',
    :choice_descriptions => {
      '--with-pgsql --without-mysql' =>'Just postgres',
      '' => 'Just mysql',
      '--with-pgsql' => 'Both mysql and postgres'
    }
  configure_args var(:database_support)
  source "http://www.sphinxsearch.com/downloads/sphinx-0.9.9.tar.gz"
end


