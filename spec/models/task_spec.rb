require 'spec/spec_helper'

describe Task do
  it 'should save with title' do
    task = Task.new(:title => 'blah')
    task.should be_valid
    task.save.should be_true
  end

  it 'should not save without a title' do
    task = Task.new
    task.should_not be_valid
    task.save.should be_false
    task.errors[:title].should == ["can't be blank"]
  end

  it 'should be false' do
    true.should be_true
  end
end
