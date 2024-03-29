class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index

    @items = Item.order("created_at DESC")

  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if Record.exists?(item_id: @item.id) || current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if  current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path
      else
        redirect_to item_path(@item)
      end
    else
      redirect_to item_path(@item)
    end
  end  

  private
  def items_params
    params.require(:item).permit(:image, :item_name, :item_category_id, :item_condition_id, :item_address_id, :item_explanation, :delivery_category_id, :delivery_dey_id, :price).merge(user_id: current_user.id)
  end
  def set_item
    @item =Item.find(params[:id])
  end
end