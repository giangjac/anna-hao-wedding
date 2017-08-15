###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration
activate :sprockets

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload, host: '127.0.0.1', livereload_css_target: nil
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :deploy do |deploy|
  deploy.deploy_method        = :rsync
  deploy.host          = 'jacky@annahaowedding.com'
  deploy.path          = '/var/www/annahaowedding'
  deploy.user          = 'jacky'
  deploy.build_before  = true
  # Optional Settings
  # deploy.user  = 'tvaughan' # no default
  # deploy.port  = 5309 # ssh port, default: 22
  # deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
end

# Build-specific configuration
configure :build do
  activate :favicon_maker, :icons => {
    "_favicon_template.png" => [
      { icon: "apple-touch-icon-180x180-precomposed.png" },
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-144x144-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "favicon.png", size: "16x16" },
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
    ]
  }
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
