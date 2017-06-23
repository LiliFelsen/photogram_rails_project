class SearchController < ApplicationController

  def index
    @search = params[:search]
    if params[:search]
      @tags = Tag.search(params[:search]).order("created_at DESC")
      params[:search] = nil
    else
      @tags = Tag.all.order("created_at DESC")
      params[:search] = nil 
    end
  end

end
