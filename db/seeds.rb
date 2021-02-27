# Add seed data here. Seed your database with `rake db:seed`

# require_all 'app'
Artist.create(name: "Artist_01")
Artist.create(name: "Artist_02")
Artist.create(name: "Artist_03")
Artist.create(name: "Artist_04")
Artist.create(name: "Artist_05")
Artist.create(name: "Artist_06")

Song.create(name: "Song_01", artist_id: 1)
Song.create(name: "Song_02", artist_id: 1)
Song.create(name: "Song_03", artist_id: 2)
Song.create(name: "Song_04", artist_id: 3)
Song.create(name: "Song_05", artist_id: 3)
Song.create(name: "Song_06", artist_id: 3)
Song.create(name: "Song_07", artist_id: 4)
Song.create(name: "Song_08", artist_id: 5)
Song.create(name: "Song_09", artist_id: 6)
Song.create(name: "Song_10", artist_id: 2)
Song.create(name: "Song_11", artist_id: 6)

SongGenre.create(song_id: 1, genre_id: 1)
SongGenre.create(song_id: 2, genre_id: 2)
SongGenre.create(song_id: 3, genre_id: 3)
SongGenre.create(song_id: 4, genre_id: 4)
SongGenre.create(song_id: 5, genre_id: 1)
SongGenre.create(song_id: 6, genre_id: 2)
SongGenre.create(song_id: 7, genre_id: 3)
SongGenre.create(song_id: 8, genre_id: 4)
SongGenre.create(song_id: 9, genre_id: 1)
SongGenre.create(song_id: 10, genre_id: 2)
SongGenre.create(song_id: 11, genre_id: 3)
SongGenre.create(song_id: 1, genre_id: 4)

Genre.create(name: "Genre_01")
Genre.create(name: "Genre_02")
Genre.create(name: "Genre_03")
Genre.create(name: "Genre_04")