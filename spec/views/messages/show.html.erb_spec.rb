require 'spec_helper'

describe "messages/show" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :to => 1,
      :from => 2,
      :from_role => "From Role",
      :read => false,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/From Role/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
  end
end
