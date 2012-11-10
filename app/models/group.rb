# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  teacher_id  :integer
#  name        :string(255)
#  description :string(255)
#  tags        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  belongs_to :teacher
  attr_accessible :description, :name, :tags
end
