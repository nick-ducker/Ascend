class CreateTicks < ActiveRecord::Migration[6.0]
  def change
    create_table :ticks do |t|
      t.date :date
      t.string :name
      t.string :climbtype
      t.integer :grade
      t.string :style
      t.string :crag
      t.text :comment
      t.text :beta

      t.timestamps
    end
  end
end
