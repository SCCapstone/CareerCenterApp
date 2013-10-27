require 'spec_helper'

describe Conference do
  it "should have many Tables" do 
  	t = Conference.reflect_on_association(:tables)
  	t.macro.should == :has_many
  end

  it "should have many Employers" do
  	t = Conference.reflect_on_association(:employers)
  	t.macro.should == :has_many
  end
end
