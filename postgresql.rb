pkg 'postgres software' do
  installs {
    via :apt, %w[postgresql postgresql-client libpq-dev]
    via :brew, 'postgresql'
  }
  provides 'psql'
  after :on => :osx do
    shell "initdb /usr/local/var/postgres" and
    shell "cp /usr/local/Cellar/postgresql/9.0.1/org.postgresql.postgres.plist ~/Library/LaunchAgents" and
    shell "launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist"
  end
end





