require 'spec_helper'

describe "tables/index" do
  before(:each) do
    assign(:tables, [
      stub_model(Table,
        :num => 1,
        :conference_id => 2,
        :employer_id => 3,
        :last_edit => "Last Edit"
      ),
      stub_model(Table,
        :num => 1,
        :conference_id => 2,
        :employer_id => 3,
        :last_edit => "Last Edit"
      )
    ])
  end

  it "renders a list of tables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Last Edit".to_s, :count => 2
  end
end
