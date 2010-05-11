dep 'remote' do
  requires_when_unmet 'no remote called origin'
  define_var :remote_repo_name, :default => Dir.pwd.p.basename.to_s
  met? {
    shell("git remote -v")["#{var :git_remote}:#{var :remote_repo_name}"]
  }
  meet {
    shell("git remote add origin #{var :git_remote}:#{var :remote_repo_name}")
  }
end

dep 'no remote called origin' do
  met? { shell("git remote -v")[/^origin\b/].nil? }
  before { failable_shell("git remote rm renamed_by_babushka") }
  meet { shell("git remote rename origin renamed_by_babushka") }
end
