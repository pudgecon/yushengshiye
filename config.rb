###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###
helpers do
  def link_to(*args, &block)
    url_arg_index = block_given? ? 0 : 1
    if url = args[url_arg_index]
      url.start_with?("#") ? (new_url = url) :
        (new_url = I18n.locale == :en ? "/en#{url}" : url)
      args[url_arg_index] = new_url
    end

    super(*args, &block)
  end

  def nav_link_to(name, url, options = {})
    options = {
      class: ""
    }.update(options)

    new_url = I18n.locale == :en ? "/en#{url}" : url
    active = Regexp === new_url ? current_page.url =~ new_url : current_page.url == new_url

    options[:class] += " active" if active

    link_to name, url, options
  end
end

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :i18n, :langs => ['zh-CN', 'en']

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
