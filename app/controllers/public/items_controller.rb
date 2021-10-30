class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all

  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def search
    @genres = Genre.all
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
      @genre = Genre.find(params[:genre_id])
    else
      redirect_to public_items_path
    end
  end

  private

  def item_params
    params.repuire(:item).permit(:image, :name, :genre_id, :price, :is_active, :introduction, :cart_item)
  end

end
