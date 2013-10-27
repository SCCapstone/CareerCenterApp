require 'spec_helper'

describe Employer do
	it "should belong to Conference" do 
		t = Employer.reflect_on_association(:conference)
  	t.macro.should == :belongs_to
 	end
	it "should have one Table" do
		t = Employer.reflect_on_association(:table)
  	t.macro.should == :has_one
  end
end
