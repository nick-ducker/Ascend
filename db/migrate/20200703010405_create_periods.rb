class CreatePeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :periods do |t|
      t.string :title
      t.string :type
      t.text :description
      t.integer :days
      t.boolean :shared
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
