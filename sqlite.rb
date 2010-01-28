
gem 'sqlite gem' do
  requires 'sqlite software'
  installs 'sqlite3-ruby'
  provides []
end

dep 'sqlite software'
  installs {
    via :apt, %w[libsqlite3-ruby libsqlite3-dev]
    via :brew, 'sqlite'
  }
  provides 'sqlite'
end