require 'spec_helper'

describe "tables/show" do
  before(:each) do
    @table = assign(:table, stub_model(Table,
      :num => 1,
      :conference_id => 2,
      :employer_id => 3,
      :last_edit => "Last Edit"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Last Edit/)
  end
end
