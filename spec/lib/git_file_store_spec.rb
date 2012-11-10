require 'spec_helper'

describe GitFileStore do
  let(:student) { create(:student) }
  let(:group) { create(:group) }

  describe ".repo_path" do
    it "includes the student id int the path" do
      student.should_receive(:id).and_return("101010")
      GitFileStore.repo_path(student, group).should match("/101010")
    end

    it "includes the group id int the path" do
      group.should_receive(:id).and_return("101010")
      GitFileStore.repo_path(student, group).should match("/101010")
    end

    it "includes rails root in the path" do
      GitFileStore.repo_path(student, group).should match(Rails.root.to_s)
    end
  end


  describe ".new" do
    it "initializes a git repo" do
      GitFileStore.new(student, group).instance_variable_get(:@git).should be_a(Git::Base)
    end

    it "opens an existing git repo without error" do
      GitFileStore.new(student, group)
      expect {
        GitFileStore.new(student, group).instance_variable_get(:@git).should be_a(Git::Base)
      }.not_to raise_error
    end
  end

  describe "#store" do
    let(:repo) { GitFileStore.new(student, group) }
    let(:assignment) { create(:assignment) }
    let(:data) { SecureRandom.base64 }
    it "stores a file in the git repo" do
      repo.store(assignment, ".rb", data)
      Dir.glob(File.join(App.repo_root_path, "**", "*.rb")).should_not be_empty
    end
  end

  describe "#retrieve" do
    let(:repo) { GitFileStore.new(student, group) }
    let(:assignment) { create(:assignment) }
    let(:data) { SecureRandom.base64 }
    it "stores a file in the git repo" do
      repo.store(assignment, ".rb", data)
      repo.retrieve(assignment, ".rb").should == data
    end
  end

end
