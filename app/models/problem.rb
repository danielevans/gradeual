class Problem < ActiveRecord::Base
  attr_accessible :max_cpu_seconds, :max_megabytes, :max_total_seconds, :name, :reference_code, :template_code, :user_id, :description, :language, :tags, :default_value
  has_many :problem_test
  belongs_to :teacher
    
  validates :language, :name, :max_cpu_seconds, :max_megabytes, :max_total_seconds, :presence => true
  validates :name, :uniqueness => true
  validates :language, :inclusion => { :in => App.supported_languages}
  
end
