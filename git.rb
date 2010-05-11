dep 'remote' do
  requires 'default remote'
  
  met? {
    shell("git remote -v")["origin	git@git.inspire9.com.au:#{Dir.pwd.p.basename} (fetch)"]
  }
  meet {
    shell("git remote add origin git@git.inspire9.com.au:#{Dir.pwd.p.basename}")
  }
end

dep 'default remote' do
  met? {
    failable_shell("echo $DEFAULT_REMOTE").stderr["git@git.inspire9.com.au"]
  }
  meet {
    sudo "export DEFAULT_REMOTE=git@git.inspire9.com.au"
  }
end