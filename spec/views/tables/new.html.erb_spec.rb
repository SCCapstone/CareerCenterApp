require 'spec_helper'

describe "tables/new" do
  before(:each) do
    assign(:table, stub_model(Table,
      :num => 1,
      :conference_id => 1,
      :employer_id => 1,
      :last_edit => "MyString"
    ).as_new_record)
  end

  it "renders new table form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tables_path, "post" do
      assert_select "input#table_num[name=?]", "table[num]"
      assert_select "input#table_conference_id[name=?]", "table[conference_id]"
      assert_select "input#table_employer_id[name=?]", "table[employer_id]"
      assert_select "input#table_last_edit[name=?]", "table[last_edit]"
    end
  end
end
