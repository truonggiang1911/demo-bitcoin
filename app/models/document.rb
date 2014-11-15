class Document < ActiveRecord::Base
  attr_accessible :name, :price, :currency
end
