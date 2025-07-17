class CreateAdoptions < ActiveRecord::Migration[7.1]
  def change
    create_table :adoptions do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.jsonb :adopter_info

      t.timestamps
    end
  end
end
