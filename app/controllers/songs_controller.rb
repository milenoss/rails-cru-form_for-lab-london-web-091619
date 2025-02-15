class SongsController < ApplicationController
    def index 

        @song = Song.all 
        
        end
        
        def new 
        
        @song = Song.new 
        render :form
        end
        
        def create 
        
        @song = Song.create(song_params(:name, :artist_id,:genre_id))
        
        redirect_to song_path(@song)
        end
        
        def show 
        
        @song = Song.find(params[:id])
        @genre = @song.genre
        @artist = @song.artist
        
        end
        
        
        def edit 
        @song = Song.find(params[:id])
        render :form
        
        end
        
        def update 
        @song = Song.find(params[:id])
        @song.update(song_params(:name, :artist_id,:genre_id ))
        @song.save
        redirect_to song_path(@song)

        end
        
        private
        
        def song_params(*args)
            params.require(:song).permit(*args)
        end
        end
