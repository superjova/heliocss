require 'rack'
require 'middleman/rack'
require 'rack/contrib/try_static'

# Enable proper HEAD responses
use Rack::Head
# Serve files from the build directory
use Rack::TryStatic,
  root: 'build',
  urls: %w[/],
  try: ['.html', 'index.html', '/index.html']

run lambda { |env|
  [
    404,
    {
      'Content-Type'  => 'text/html'
    },
    File.open("build/404/index.html", File::RDONLY)
  ]
}
