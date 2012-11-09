require 'spec_helper'

describe Problem do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:language) }
  it { should ensure_inclusion_of(:language).in_array(App.supported_languages)}
end
