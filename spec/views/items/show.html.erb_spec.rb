require 'spec_helper'

describe "items/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "test",
      :description => 'project_description'
    ))
    @item = assign(:item, stub_model(Item,
      :description => "MyText",
      :opened => false,
      :project_id => @project.id
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
