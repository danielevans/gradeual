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

require 'spec_helper'

describe Group do
end
