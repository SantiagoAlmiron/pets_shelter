class CreateIdentities < ActiveRecord::Migration[7.1]
  def change
    create_table :identities do |t|
      t.boolean :accepted_terms, null: false, default: false
      t.boolean :has_children, null: false, default: false
      t.boolean :has_other_pets, null: false, default: false
      t.date :birth_date
      t.references :user, null: false, foreign_key: true
      t.string :apartment, limit: 10
      t.string :birth_state, limit: 100
      t.string :city, limit: 100
      t.string :dni, limit: 20
      t.string :floor, limit: 10
      t.string :gender, limit: 20
      t.string :name, limit: 50
      t.string :phone, limit: 20
      t.string :postal_code, limit: 10
      t.string :street_name, limit: 100
      t.string :street_number, limit: 10
      t.string :surname, limit: 50

      t.timestamps
    end

    add_index :identities, :dni, unique: true
  end
end
