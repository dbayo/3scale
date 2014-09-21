require 'spec_helper'

describe "Items" do
  describe "GET /project/1/items" do

  	let(:project) { Project.create!(name: 'test', description: 'test') }

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get project_items_path(project)
      response.status.should be(200)
    end
  end
end
