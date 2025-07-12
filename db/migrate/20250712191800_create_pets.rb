class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.text :about_pet
      t.text :physical_characteristics
      t.text :personality
      t.boolean :sociable
      t.decimal :weight
      t.string :status, default: 'in_evaluation', null: false
      t.integer :spot

      t.datetime :entry_date, null: false
      t.datetime :exit_date
      t.timestamps
    end
  end
end
