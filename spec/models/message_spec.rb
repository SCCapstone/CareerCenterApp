require 'spec_helper'

describe Message do
  it "should belong to User" do
  	t = Message.reflect_on_association(:user)
  	t.macro.should == :belongs_to
  end
end
