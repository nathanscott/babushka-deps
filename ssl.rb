nginx 'generate csr' do
  requires 'webserver installed'
  met? { %w[key csr].all? {|ext| (nginx_cert_path / "#{var :domain}.#{ext}").exists? } }
  meet {
    in_dir nginx_cert_path, :create => "700", :sudo => true do
      log_shell("generating private key", "openssl genrsa -out #{var :domain}.key 2048", :sudo => true) and
      log_shell("generating certificate", "openssl req -nodes -newkey rsa:2048 -keyout #{var :domain}.key -out #{var :domain}.csr",
        :sudo => true, :input => [
          var(:country, :default => 'AU'),
          var(:state),
          var(:city, :default => ''),
          var(:organisation),
          var(:organisational_unit, :default => ''),
          var(:domain),
          var(:email),
          '', # password
          '', # optional company name
          '' # done
        ].join("\n")
      )
      shell("echo 'Your CSR:'").tap_log
      shell("cat #{var :domain}.csr").tap_log
    end
  }
end

nginx 'sign cert' do
  requires 'generate csr'
  met? { (nginx_cert_path / "#{var :domain}.crt").exists? && grep(var(:ssl_certificate), (nginx_cert_path / "#{var :domain}.crt")) }
  before { shell 'rm -f #{nginx_cert_path / "#{var :domain}.crt"}' }
  meet {
    in_dir nginx_cert_path, :create => "700", :sudo => true do
      append_to_file var(:ssl_certificate), (nginx_cert_path / "#{var :domain}.crt"), :sudo => true
    end
    restart_nginx
  }
end