require 'spec_helper'

describe Submission do
  let(:submission) { create(:submission) }
  describe "#code" do
    it "initializes a git file store" do
      GitFileStore.should_receive(:new).with(submission.student, submission.assignment.group)
      submission.code
    end

    it "retrieves the file from the store" do
      GitFileStore.any_instance.should_receive(:retrieve)
      submission.code
    end
  end

  describe "#submit_code" do
    it "should submit code to the server" do
      true
    end
  end

  describe "#to_json" do
    it "should include MaxCPUSeconds" do
      tests = []
      submission.assignment.problem.problem_tests.each do |t|
         tests << t.driver
      end
      json = {
        "MaxCPUSeconds" => submission.assignment.problem.max_cpu_seconds,
        "MaxTotalSeconds" => submission.assignment.problem.max_total_seconds,
        "MaxMB" => submission.assignment.problem.max_megabytes,
        "Reference" => submission.assignment.problem.reference_code,
        "Candidate" => submission.code,
        "Tests" => tests
      }.to_json
      submission.to_json.should eq json
    end
  end
end
