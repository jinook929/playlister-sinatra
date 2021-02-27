require_relative './concerns/slugifiable'

class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  validates :name, presence: true

  # def slug
  #   self.name.downcase.split.join("-")
  # end

  # def self.find_by_slug(slug)
  #   name = slug.split("-").map {|i| i.capitalize}.join(" ")
  #   self.find_by(name: name)
  # end
end