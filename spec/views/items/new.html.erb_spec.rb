require 'spec_helper'

describe "items/new" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "test",
      :description => 'project_description'
    ))
    assign(:item, stub_model(Item,
      :description => "MyText",
      :opened => false,
      :project_id => @project.id
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_items_path(@project), "post" do
      assert_select "textarea#item_description[name=?]", "item[description]"
      assert_select "input#item_opened[name=?]", "item[opened]"
    end
  end
end
