class ItemsController < ApplicationController
  respond_to :htmk, :xml, :js
  
  #def new
   # @list = List.find(params[:list_id])
    #@item = @list.items.new
  #end
  
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(params[:item]) # use build instead of new. 
    # @item = Item.new
    if @item.save
      flash[:notice] = "Item created"
      redirect_to list_url(@list)
    else
      flash[:error] = "Could not add item at this time."
      redirect_to list_url(@list)  
    end
  end    
  
  def update
    
  end  
end
