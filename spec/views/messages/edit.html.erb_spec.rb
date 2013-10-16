require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :to => 1,
      :from => 1,
      :from_role => "MyString",
      :read => false,
      :content => "MyText"
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", message_path(@message), "post" do
      assert_select "input#message_to[name=?]", "message[to]"
      assert_select "input#message_from[name=?]", "message[from]"
      assert_select "input#message_from_role[name=?]", "message[from_role]"
      assert_select "input#message_read[name=?]", "message[read]"
      assert_select "textarea#message_content[name=?]", "message[content]"
    end
  end
end
