require 'flickraw-cached'

class Orange::FlickrResource < Orange::Resource
  call_me :flickr
  viewable :gallery, :photoset
  
  def stack_init
    FlickRaw.api_key = orange.options["flickr_api_key"] || "d25ed6ad71472b633b11544a21da4f36"
    options["flickr_nsid"] = orange.options["flickr_nsid"] || false
  end
  
  def photosets
    if FlickRaw.api_key && options["flickr_nsid"]
      ret = {}
      sets = flickr.photosets.getList(:user_id => options["flickr_nsid"])
      sets_url = FlickRaw::URL_PHOTOSTREAM + options["flickr_nsid"] + "/sets/"
      sets.each{|set| ret[set.title] = sets_url + set.id}
      ret
    else
      false
    end
  end
  
  def gallery
    if options["flickr_nsid"]
      sets_url = FlickRaw::URL_PHOTOSTREAM + options["flickr_nsid"] + "/sets"
    else
      false
    end
  end
end