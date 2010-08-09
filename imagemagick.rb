dep 'rmagick.gem' do
  requires 'imagemagick.managed'
  installs 'rmagick'
  provides []
end

dep 'imagemagick.managed' do
  installs {
    via :apt, %w[imagemagick libmagickwand-dev]
    via :brew, 'imagemagick'
    via :macports, 'imagemagick'
  }
end