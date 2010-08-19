require 'flickraw-cached'
require 'orange-core'

class Orange::FlickrResource < Orange::Resource
  call_me :flickr
  viewable :gallery, :photoset, :galleries, :show
  
  def exposed(packet); [:galleries, :show]; end
  
  def stack_init
    FlickRaw.api_key = orange.options["flickr_api_key"] || "d25ed6ad71472b633b11544a21da4f36"
    options["flickr_nsid"] = orange.options["flickr_nsid"] || false
  end
  
  def photosets(packet, opts = {})
    if FlickRaw.api_key && options["flickr_nsid"]
      ret = {}
      sets = flickr.photosets.getList(:user_id => options["flickr_nsid"])
      sets
    else
      false
    end
  end
  
  def gallery(packet, opts = {})
    if options["flickr_nsid"]
      sets_url = FlickRaw::URL_PHOTOSTREAM + options["flickr_nsid"] + "/sets"
    else
      false
    end
  end
end