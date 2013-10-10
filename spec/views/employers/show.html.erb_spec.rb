require 'spec_helper'

describe "employers/show" do
  before(:each) do
    @employer = assign(:employer, stub_model(Employer,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Last Edit/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
