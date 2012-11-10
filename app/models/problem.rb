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

class Problem < ActiveRecord::Base
  attr_accessible :max_cpu_seconds, :max_megabytes, :max_total_seconds, :name, :reference_code, :template_code, :user_id, :description, :language, :tags, :default_value, :problem_tests_attributes
  has_many :problem_tests
  accepts_nested_attributes_for :problem_tests,
    :allow_destroy => true

  belongs_to :teacher

  validates :language, :name, :max_cpu_seconds, :max_megabytes, :max_total_seconds, :presence => true
  validates :name, :uniqueness => true
  validates :language, :inclusion => { :in => App.supported_languages}

  def to_s
    name
  end
end
