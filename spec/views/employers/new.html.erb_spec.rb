require 'spec_helper'

describe "employers/new" do
  before(:each) do
    assign(:employer, stub_model(Employer,
      :name => "MyString",
      :website => "MyText",
      :description => "MyText",
      :majors => "MyText",
      :email => "MyString",
      :positions => "MyText",
      :tips => "MyText",
      :last_edit => "MyString",
      :table_id => 1,
      :conference_id => 1
    ).as_new_record)
  end

  it "renders new employer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employers_path, "post" do
      assert_select "input#employer_name[name=?]", "employer[name]"
      assert_select "textarea#employer_website[name=?]", "employer[website]"
      assert_select "textarea#employer_description[name=?]", "employer[description]"
      assert_select "textarea#employer_majors[name=?]", "employer[majors]"
      assert_select "input#employer_email[name=?]", "employer[email]"
      assert_select "textarea#employer_positions[name=?]", "employer[positions]"
      assert_select "textarea#employer_tips[name=?]", "employer[tips]"
      assert_select "input#employer_last_edit[name=?]", "employer[last_edit]"
      assert_select "input#employer_table_id[name=?]", "employer[table_id]"
      assert_select "input#employer_conference_id[name=?]", "employer[conference_id]"
    end
  end
end
