class CreateLineDescriptions < ActiveRecord::Migration
  def change
    create_table :line_descriptions do |t|
      t.string :title
      t.float :rate

      t.timestamps
    end
  end
end
