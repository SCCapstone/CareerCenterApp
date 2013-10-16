require 'spec_helper'

describe "conferences/show" do
  before(:each) do
    @conference = assign(:conference, stub_model(Conference,
      :name => "Name",
      :location => "Location",
      :description => "MyText",
      :last_edit => "Last Edit"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Location/)
    rendered.should match(/MyText/)
    rendered.should match(/Last Edit/)
  end
end
