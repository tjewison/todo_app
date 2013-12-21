require 'spec_helper'

describe TaskEntry do
  it "should be valid with valid attributes" do
    FactoryGirl.build(:task_entry).should be_valid
  end

  it "should be invalid without a description" do
    FactoryGirl.build(:task_entry, :description => nil).should_not be_valid
    FactoryGirl.build(:task_entry, :description => "").should_not be_valid
  end
end
