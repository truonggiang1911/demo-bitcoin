class List < ActiveRecord::Base
  attr_accessible :name, :items_attributes # white label
  validates :name, :presence => true
  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  def items_completed?
    return(self.items.where(:completed => false).count <= 0)
  end 
  
  def items_incompleted?
    return(self.items.where(:completed => false).count >  0)
  end   
  
  def get_items_incompleted_count
    return self.items.where(:completed => false).count
  end
end