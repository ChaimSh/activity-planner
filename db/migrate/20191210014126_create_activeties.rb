class CreateActiveties < ActiveRecord::Migration[6.0]
  def change
    create_table :activeties do |t|
      t.string :name
      t.string :description
      t.integer :duration
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end