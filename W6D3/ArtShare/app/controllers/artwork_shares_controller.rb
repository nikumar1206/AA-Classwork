class ArtworkSharesController < ApplicationController
  def create
    shared_artwork = ArtworkShare.new(artwork_share_params)
    if shared_artwork.save
      render json: shared_artwork
    else
      render json: shared_artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    to_be_deleted = ArtworkShare.find_by(artwork_id: params[:artwork_id])
    to_be_deleted.destroy
    render json: to_be_deleted
  end

  private
  def artwork_share_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end
end