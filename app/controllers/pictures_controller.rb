class PicturesController < ApplicationController
before_action :authenticated
before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    @picture.user_id = current_user.id
    if !params[:picture][:tag_ids].empty?
      params[:picture][:tag_ids].each do |t|
        if !t.empty?
          @picture.tags << Tag.find(t)
        end
      end
    end
    if !params[:tag][:name].empty?
      new_tag = Tag.find_or_create_by(name: params[:tag][:name].capitalize)
      @picture.tags << new_tag
    end
    if @picture.save
      redirect_to picture_path(@picture)
    else
      render 'new'
    end
  end

  def edit
    @picture.tags.build
  end

  def update
    if @picture.update(picture_params)
       redirect_to picture_path(@picture)
     else
       render 'edit'
     end
  end

  def show
    @comment = Comment.new
  end

  def index
    @pictures = Picture.where.not(user_id: current_user.id)
  end

  def destroy
    @picture.destroy
    redirect_to user_path(current_user)
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :title, :tag, :tag_ids)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
