class Problem < ActiveRecord::Base
  attr_accessible :max_cpu_seconds, :max_megabytes, :max_total_seconds, :name, :reference_code, :template_code, :user_id, :description, :language, :tags, :default_value, :problem_tests_attributes
  has_many :problem_tests
  accepts_nested_attributes_for :problem_tests,
    :allow_destroy => true

  belongs_to :teacher

  validates :language, :name, :max_cpu_seconds, :max_megabytes, :max_total_seconds, :presence => true
  validates :name, :uniqueness => true
  validates :language, :inclusion => { :in => App.supported_languages}

end
