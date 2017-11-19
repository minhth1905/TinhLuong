class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :worker, foreign_key: true
      t.references :year, foreign_key: true
      t.references :month, foreign_key: true
      t.references :day, foreign_key: true
      t.integer :typee, default: 0
      t.integer :number, default: 0
      t.integer :show, default: 0

      t.timestamps
    end
  end
end
