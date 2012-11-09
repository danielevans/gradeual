# == Schema Information
#
# Table name: problems
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  description       :text
#  language          :string(255)
#  tags              :string(255)
#  teacher_id        :integer
#  default_value     :integer
#  template_code     :text
#  reference_code    :text
#  max_cpu_seconds   :integer
#  max_total_seconds :integer
#  max_megabytes     :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe Problem do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:language) }
  it { should ensure_inclusion_of(:language).in_array(App.supported_languages)}
end
