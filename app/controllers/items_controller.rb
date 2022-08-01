class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, only: [:edit, :show, :update, :destroy]

  def index
    #@items = item.all
    #@items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if Record.exists?(items_id: @items.id) || current_user.id != @items.user_id
      redirect_to root_path      
    end
  end

  def update
    if @items.update(items_params)
      redirect_to items_path(@items)
    else
      render :edit
    end
  end

  def destroy
    if  current_user.id == @items.user_id
      if @items.destroy
        redirect_to root_path
      else
        redirect_to items_path(@items)
      end
    else
      redirect_to items_path(@items)
    end
  end  

  private
  def items_params
    params.require(:item).permit(:image, :item_name, :item_category_id, :item_condition_id, :item_address_id, :item_explanation, :delivery_category_id, :delivery_dey_id, :price).merge(user_id: current_user.id)
  end
  def set_items
    @items =Items.find(params[:id])
  end
end