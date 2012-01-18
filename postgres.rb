dep 'postgres access', :username do
  requires 'benhoskings:postgres.managed', 'benhoskings:user exists'.with(:username => username)
  met? { !sudo("echo '\\du' | #{which 'psql'}", :as => '_postgres').split("\n").grep(/^\W*\b#{username}\b/).empty? }
  meet { sudo "createuser -SdR #{username}", :as => '_postgres' }
end