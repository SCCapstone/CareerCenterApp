require 'spec_helper'

describe "conferences/new" do
  before(:each) do
    assign(:conference, stub_model(Conference,
      :name => "MyString",
      :location => "MyString",
      :description => "MyText",
      :last_edit => "MyString"
    ).as_new_record)
  end

  it "renders new conference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conferences_path, "post" do
      assert_select "input#conference_name[name=?]", "conference[name]"
      assert_select "input#conference_location[name=?]", "conference[location]"
      assert_select "textarea#conference_description[name=?]", "conference[description]"
      assert_select "input#conference_last_edit[name=?]", "conference[last_edit]"
    end
  end
end
