class AddProjectIdToItem < ActiveRecord::Migration
  def change
    add_reference :items, :project, index: true
  end
end
