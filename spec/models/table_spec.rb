require 'spec_helper'

describe Table do
  it "should belong to Conference" do
  	t = Table.reflect_on_association(:conference)
  	t.macro.should == :belongs_to
  end
  it "should have one Employer" do
  	t = Table.reflect_on_association(:employer)
  	t.macro.should == :has_one
  end
end
