class SearchesController < ApplicationController
  
  def search
    @value = params[:value]
    @datas = search_for(@value).page(params[:page])
    @genres = Genre.all
  end
  
  private
  
  def search_for(value)
    Item.where("name LIKE ?", "%#{value}%").or(Item.where(genre_id: value))
  end
  
end
