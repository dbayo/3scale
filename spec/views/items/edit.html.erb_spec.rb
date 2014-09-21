require 'spec_helper'

describe "items/edit" do
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

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_item_path(@project, @item), "post" do
      assert_select "textarea#item_description[name=?]", "item[description]"
      assert_select "input#item_opened[name=?]", "item[opened]"
    end
  end
end
