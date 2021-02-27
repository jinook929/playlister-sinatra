require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    # @song = Song.create(params[:song])
    # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # @song.genre_ids = params[:genres]
    # @song.save

    # flash[:message] = "Successfully created song."
    # redirect("/songs/#{@song.slug}")

    @song = Song.create(params[:song])
    if params[:artist][:name].empty?
      @song.artist_id = params[:artist][:id]
    else
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    params[:genres][:name].each {|name|
      @song.genres << Genre.find_or_create_by(name: name) unless name.empty?
    }

    if @song.save
      flash[:message] = "Successfully created song."
    end
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/edit' 
  end
  
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if params[:artist][:name].empty? # with existing artist on the list
      @song.artist_id = params[:artist][:id]
    else                             # without existing artist on the list
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    params[:genres][:name].each {|name|
      genre = Genre.find_or_create_by(name: name) unless name.empty?
      @song.genres << genre if (genre && !Genre.all.include?(genre))
    }

    if @song.save
      flash[:message] = "Successfully updated song."
    end
    redirect "/songs/#{@song.slug}"
  end
end