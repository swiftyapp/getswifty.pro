# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
GH_USERNAME = 'swiftyapp'
GH_REPO = 'swifty'
GH_TAG = '0.6.11'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/google_oauth2/callback/*.html', layout: false

page '/download/**', layout: false

activate :inline_svg
activate :meta_tags
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-91455305-7'
  ga.domain_name = 'getswifty.pro'
end

helpers do
  def current_version
    GH_TAG
  end

  def dist_url(type)
    base = "https://github.com/#{GH_USERNAME}/#{GH_REPO}/releases/download/v#{GH_TAG}/"
    case type
    when 'mac'
      "#{base}Swifty-#{GH_TAG}.dmg"
    when 'win'
      "#{base}Swifty-Setup-#{GH_TAG}.exe"
    when 'deb'
      "#{base}Swifty_#{GH_TAG}_amd64.deb"
    when 'rpm'
      "#{base}Swifty_#{GH_TAG}.x86_64.rpm"
    when 'appimage'
      "#{base}Swifty-#{GH_TAG}.AppImage"
    end
  end
end
# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
