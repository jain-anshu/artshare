class ArtworkSharesController < ApplicationController
    def create
      @artwork_share = AtrworkShare.new(artwork_share_params)
      if @artwork_share.save
        render json: @artwork_share, status: :created
      else
        render json: @artwork_share.errors.full_messages
      end
    end
    
    def destroy
      @artwork_share = ArtworkShare.find(params[:id])
      @artwork_share.destroy
      render json: @artwork_share
    end
    
    private
    def artwork_share_params
      params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end