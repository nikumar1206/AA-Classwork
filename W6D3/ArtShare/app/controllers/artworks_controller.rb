class ArtworksController < ApplicationController
  def index
    user_artworks = Artwork.find_by(artist_id: params[:user_id])
    shared_artworks = User.find(params[:user_id]).shared_artworks
    render json: { user_art: user_artworks, shared_art: shared_artworks }
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end