require 'orange-core'
require 'orange-flickr/resources/flickr_resource'

module Orange::Plugins
  class Flickr < Base
    assets_dir      File.join(File.dirname(__FILE__), 'assets')
    views_dir       File.join(File.dirname(__FILE__), 'views')
    # templates_dir   File.join(File.dirname(__FILE__), 'templates')
    
    resource    Orange::FlickrResource.new
  end
end

Orange.plugin(Orange::Plugins::Flickr.new)
