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


    it "does not commit when the code is re-submitted" do
      submission.code = "asdfghquier"
      submission.save!
      submission.code = "asdfghquier"
      GitFileStore.any_instance.should_not_receive(:store)
      submission.save!
    end
  end
end
