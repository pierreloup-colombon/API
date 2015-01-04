class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :name, :string, limit: 512
    add_column :events, :description, :text
    add_column :events, :date, :datetime
  end
end
