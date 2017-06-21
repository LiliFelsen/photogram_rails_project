class PicturesController < ApplicationController
before_action :authenticated
before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      if !params[:picture][:tag_ids].empty?
        params[:picture][:tag_ids].each {|t| PictureTag.create(tag_id: t, picture_id: @picture.id) }
      end
      if !params[:picture][:tag][:name].empty?
        new_tag = Tag.find_or_create_by(name: params[:picture][:tag][:name].capitalize)
        PictureTag.create(tag_id: new_tag.id, picture_id: @picture.id)
      end
      redirect_to picture_path(@picture)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @picture.update(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      if !params[:picture][:tag_ids].empty?
        params[:picture][:tag_ids].each {|t| PictureTag.create(tag_id: t, picture_id: @picture.id)}
      end
      if !params[:picture][:tag][:name].empty?
        new_tag = Tag.find_or_create_by(name: params[:picture][:tag][:name].capitalize)
        PictureTag.create(tag_id: new_tag.id, picture_id: @picture.id)
      end
      redirect_to picture_path(@picture)
    else
      render 'edit'
    end
  end

  def show
    @comment = Comment.new
  end

  def index
    @pictures = Picture.all
  end

  def destroy
    @picture.destroy
    redirect_to user_path(current_user)
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image_url)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
