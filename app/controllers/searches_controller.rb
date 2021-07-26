class SearchesController < ApplicationController
  
  def search
    @value = params[:value]
    @how = params[:how]
    @datas = search_for(@value, @how).where(sell_status: false).page(params[:page])
    @genres = Genre.all
    @genre = Genre.find(@value) if @how == "genre"
  end
  
  private
  
  def item_search(value)
    Item.where("name LIKE ?", "%#{value}%")
  end
  
  def genre_seach(value)
    Item.where(genre_id: value)
  end
  
  def search_for(value, how)
    case how
    when "item"
      item_search(value)
    when "genre"
      genre_seach(value)
    end
  end
  
end
