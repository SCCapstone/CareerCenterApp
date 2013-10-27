require 'spec_helper'

describe User do
	it "should have many Messages" do
		t = User.reflect_on_association(:messages)
	  	t.macro.should == :has_many
	end
end
