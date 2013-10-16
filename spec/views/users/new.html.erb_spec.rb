require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :role => "MyString",
      :favorites => "MyText",
      :source => "MyString",
      :token => "",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_role[name=?]", "user[role]"
      assert_select "textarea#user_favorites[name=?]", "user[favorites]"
      assert_select "input#user_source[name=?]", "user[source]"
      assert_select "input#user_token[name=?]", "user[token]"
      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
