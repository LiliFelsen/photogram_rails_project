class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(user_id: current_user.id, title: params[:picture][:title], image_url: params[:picture][:image_url])
    @picture_tags 
    redirect_to picture_path(@picture)
  end

  def show
  end

  def index
  end

end
