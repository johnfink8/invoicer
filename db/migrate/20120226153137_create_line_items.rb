class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :description
      t.float :hours

      t.timestamps
    end
  end
end
