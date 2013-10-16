require 'spec_helper'

describe "conferences/edit" do
  before(:each) do
    @conference = assign(:conference, stub_model(Conference,
      :name => "MyString",
      :location => "MyString",
      :description => "MyText",
      :last_edit => "MyString"
    ))
  end

  it "renders the edit conference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conference_path(@conference), "post" do
      assert_select "input#conference_name[name=?]", "conference[name]"
      assert_select "input#conference_location[name=?]", "conference[location]"
      assert_select "textarea#conference_description[name=?]", "conference[description]"
      assert_select "input#conference_last_edit[name=?]", "conference[last_edit]"
    end
  end
end
