class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!
  
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_item_path(item), notice: "新しい商品を登録しました"
    else
      @item = item
      @genres = Genre.all
      flash[:notice] = "入力内容を確認してください"
      render 'new'
    end
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:notice] = "商品を更新しました"
      redirect_to admin_item_path(item)
    else
      @item = Item.find(params[:id])
      @genres = Genre.all
      flash[:notice] = "入力内容を確認してください"
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :sell_status)
  end

end