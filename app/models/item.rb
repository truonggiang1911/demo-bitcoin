class Item < ActiveRecord::Base
  default_scope order("position ASC")
  attr_accessible :completed, :list_id, :name, :position
  belongs_to :list
  validates :name, :presence => true
  # acts_as_list
  
  def completed?
    return self.completed
  end  
  
  def incompleted?
    return (self.completed == false)
  end  
end