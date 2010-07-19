dep 'nokogiri' do
  requires 'nokogiri gem'
end

gem 'nokogiri gem' do
  requires 'xml2-config'
  installs 'nokogiri'
  provides []
end

pkg 'xml2-config' do
  installs {
    via :apt, %w[libxslt1-dev libxml2-dev]
  }
end