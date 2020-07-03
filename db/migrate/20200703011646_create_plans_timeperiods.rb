class CreatePlansTimeperiods < ActiveRecord::Migration[6.0]
  def change
    create_table :plans_timeperiods do |t|
      t.references :period, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
