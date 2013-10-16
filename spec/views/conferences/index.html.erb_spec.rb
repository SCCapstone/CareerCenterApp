require 'spec_helper'

describe "conferences/index" do
  before(:each) do
    assign(:conferences, [
      stub_model(Conference,
        :name => "Name",
        :location => "Location",
        :description => "MyText",
        :last_edit => "Last Edit"
      ),
      stub_model(Conference,
        :name => "Name",
        :location => "Location",
        :description => "MyText",
        :last_edit => "Last Edit"
      )
    ])
  end

  it "renders a list of conferences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Last Edit".to_s, :count => 2
  end
end
