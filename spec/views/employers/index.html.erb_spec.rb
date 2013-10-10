require 'spec_helper'

describe "employers/index" do
  before(:each) do
    assign(:employers, [
      stub_model(Employer,
        :name => "Name",
        :website => "MyText",
        :description => "MyText",
        :majors => "MyText",
        :email => "Email",
        :positions => "MyText",
        :tips => "MyText",
        :last_edit => "Last Edit",
        :table_id => 1,
        :conference_id => 2
      ),
      stub_model(Employer,
        :name => "Name",
        :website => "MyText",
        :description => "MyText",
        :majors => "MyText",
        :email => "Email",
        :positions => "MyText",
        :tips => "MyText",
        :last_edit => "Last Edit",
        :table_id => 1,
        :conference_id => 2
      )
    ])
  end

  it "renders a list of employers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Last Edit".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
