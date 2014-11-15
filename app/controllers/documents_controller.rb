class DocumentsController < ApplicationController

  def index
    @documents = Document.all
    # coinbase = Coinbase::Client.new("HwKyej32oO1lO5TA", "9kY6acYhGV3Q8NvolVKQptOl0tzVsKpJ")
    # r = coinbase.create_button "Your Order #1234", 42.95.to_money('USA'), "1 widget at €42.95", "my custom tracking code for this order"
  end  
  
  def new 
  end
  
  def create
  end
    
  def show
    @document = Document.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end 

end
