require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :role => "MyString",
      :favorites => "MyText",
      :source => "MyString",
      :token => "",
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_role[name=?]", "user[role]"
      assert_select "textarea#user_favorites[name=?]", "user[favorites]"
      assert_select "input#user_source[name=?]", "user[source]"
      assert_select "input#user_token[name=?]", "user[token]"
      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
