class ListsController < ApplicationController
  respond_to :html, :xml, :js
  def index
    @lists = List.all
  end  
  
  def new 
    @list = List.new
  end
  
  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "List created"
      redirect_to list_url(@list)
    else
      flash[:error] = "Could not create list"
      redirect_to new_list_url
    end
  end
  
  def show
    @list = List.find(params[:id])
    @item = @list.items.new
    #render layout: false if params[:is_ajax] == true
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "List updated"
      if params[:ajax] == "1"
        render :text => "successful"
      else
        redirect_to list_url(@list)
      end
    else 
      flash[:error] = "Could not update list"
      if params[:ajax] == "1"
        render :text => "failed"
      else      
        redirect_to edit_list_url(@list)
      end
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List deleted"
      redirect_to lists_url
    else
      flash[:error] = "Could not delete list. Some thing wrong ?"
      redirect_to lists_url
    end
  end  
  
  def show_form_create
    @list = List.find(params[:id])
    @item = @list.items.build(params[:item]) # use build instead of new.
    render '_create_item.html.erb', :layout => false
  end
  
  def mark_an_item_as_done
    @list = List.find(params[:id])
    @item = @list.items.find_by_id(params[:item_id])
    @item.update_attribute(:completed, true)
    render :text => "successful"
  end
  
  def unmark_an_item
    @list = List.find(params[:id])
    @item = @list.items.find_by_id(params[:item_id])
    @item.update_attribute(:completed, false)
    render :text => "successful"
  end    
  
  def reorder
    @list = List.find(params[:id])
    @item = @list.items.find_by_id(params[:item_id])
    render :text =>"successful"
  end 
  
  def done_reorder
    @list = List.find(params[:id])
    @list.update_attributes(params[:list])
    render :text => "successful"
  end              
end
