require 'spec_helper'

describe User do
	before :each do
		@user = User.create!(
			:name => "Corey Finley",
			:role => "student",
			:favorites => Array.new,
			:email => "finley.corey@gmail.com",
			:created_at => Time.now,
			:updated_at => Time.now)
	end

	it "should have many Messages" do
		t = User.reflect_on_association(:messages)
	  	t.macro.should == :has_many
	end

	it "should be an instance of User" do
		@user.should be_an_instance_of(User)
	end

	it "should be able to add favorites" do
		@user.add_favorite("1").should be_true
		@user.favorites.should include("1")
	end

	it "should not be able to add duplicate favorites" do
		@user.add_favorite("1").should be_true
		@user.favorites.should include("1")
		@user.add_favorite("1").should_not be_true
	end

	it "should be able to remove favorites" do
		@user.add_favorite("1").should be_true
		@user.favorites.should include("1")
		@user.remove_favorite("1").should be_true
		@user.favorites.should be_an_instance_of(Array)
	end
end
