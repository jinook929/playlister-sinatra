require_relative './concerns/slugifiable'

class Artist < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :songs
  has_many :genres, through: :songs

  validates :name, presence: true

  # def slug
  #   self.name.downcase.split.join("-")
  # end

  # def self.find_by_slug(slug)
  #   name = slug.split("-").map {|i| i.capitalize}.join(" ")
  #   self.find_by(name: name)
  # end
end
