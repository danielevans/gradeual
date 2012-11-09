class Group < ActiveRecord::Base
  belongs_to :teacher
  attr_accessible :description, :name, :tags
end
