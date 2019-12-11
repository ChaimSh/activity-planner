class CreateHostings < ActiveRecord::Migration[6.0]
  def change
    create_table :hostings do |t|
      t.datetime :date
      t.belongs_to :location, foreign_key: true
      t.belongs_to :activity, foreign_key: true

      t.timestamps
    end
  end
end
