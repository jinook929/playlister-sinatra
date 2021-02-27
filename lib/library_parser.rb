class LibraryParser
  def files
    data_path = File.join(File.dirname(__FILE__), '..', 'db', 'data')
    Dir.entries(data_path)[2..-1]
    # Dir.entries("../db/data")[2..-1]
  end

  def self.parse
    self.new.call
  end

  def parse_filename(filename)
    # filename = "Zoo Kid - Out Getting Ribs [hip-hop].mp3"
    artist_match = filename.match(/^(.*) -/)
    # => [... #<MatchData "Zoo Kid -" 1:"Zoo Kid">]
    song_match   = filename.match(/- (.*) \[/)
    genre_match  = filename.match(/\[([^\]]*)\]/)

    # artist_match[1] = "Zoo Kid"
    artist = artist_match && artist_match[1]
    song   = song_match   && song_match[1]
    genre  = genre_match  && genre_match[1]

    [artist, song, genre]
    # filename.scan(/^(.*) - (.*) \[(.*)\].mp3/)[0]
  end

  def call
    files.each do |filename|
      parts = parse_filename(filename)
      build_objects(*parts)
    end
  end

  def build_objects(artist_name, song_name, genre_name)
    song = Song.create(name: song_name)
    genre = Genre.find_or_create_by(name: genre_name)
    artist = Artist.find_or_create_by(name: artist_name)

    song.song_genres.build(genre: genre)
    song.artist = artist
    
    song.save
  end
end
