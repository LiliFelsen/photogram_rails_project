class PicturesController < ApplicationController
before_action :logged_in?
before_action :set_picture, only: [:show, :edit, :update, :destroy]
before_action :owned_picture, only: [:edit, :update, :destroy]

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
      flash[:success] = "Your picture has been created!"
      redirect_to picture_path(@picture)
    else
      flash.now[:alert] = "Your new picture couldn't be created!  Please check the form."
      render 'new'
    end
  end

  def edit
    @picture.tags.build
  end

  def update
    if @picture.update(picture_params)
      flash[:success] = "Post updated."
       redirect_to picture_path(@picture)
     else
       flash.now[:alert] = "Update failed.  Please check the form."
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

  def owned_picture
    unless current_user == @picture.user
      flash[:alert] = "Edit impossible. That picture doesn't belong to you!"
      redirect_to root_path
    end
  end

end
