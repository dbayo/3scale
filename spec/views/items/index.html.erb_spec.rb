require 'spec_helper'

describe "items/index" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "test",
      :description => 'project_description'
    ))
    assign(:items_opened, [
      stub_model(Item,
        :description => "MyText",
        :opened => true,
        :project_id => @project.id,
        :created_at => Time.now
      )
    ])
    assign(:items_closed, [
      stub_model(Item,
        :description => "MyText",
        :opened => false,
        :project_id => @project.id,
        :created_at => Time.now
      ),
      stub_model(Item,
        :description => "MyText",
        :opened => false,
        :project_id => @project.id,
        :created_at => Time.now
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :count => 15
    assert_select "tr>td", :count => 15
  end
end
