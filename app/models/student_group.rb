class StudentGroup < ActiveRecord::Base
  belongs_to :student
  belongs_to :group
  # attr_accessible :title, :body
end
