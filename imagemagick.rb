gem 'rmagick gem' do
  requires 'imagemagick software'
  installs 'mysql'
  provides []
end

pkg 'imagemagick software' do
  installs {
    via :apt, %w[imagemagick libmagickwand-dev]
    via :brew, 'imagemagick'
    via :macports, 'imagemagick'
  }
end