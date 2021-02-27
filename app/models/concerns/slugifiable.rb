module Slugifiable
  module InstanceMethods  
    def slug
      self.name.downcase.gsub(" ", "-")
      # self.name.downcase.split.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|obj| obj.slug == slug}
      # name = slug.split("-").map {|i| i.capitalize}.join(" ")
      # self.find_by(name: name)
    end
  end
end