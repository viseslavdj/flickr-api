class StaticPagesController < ApplicationController
  require 'flickr'
  
def index
  begin
    flickr = Flickr.new "2284ca3d001c4cfbd794a0954c417477", "0a08a4728cd63541"
    unless params[:user_id].blank?
      @photos = flickr.photos.search(user_id: params[:user_id])
    end
  rescue StandardError => exception
    flash[:alert] = "#{exception.message}. Try again!"
    
  end
end

end