require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :role => "Role",
      :favorites => "MyText",
      :source => "Source",
      :token => "",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Role/)
    rendered.should match(/MyText/)
    rendered.should match(/Source/)
    rendered.should match(//)
    rendered.should match(/Email/)
  end
end
