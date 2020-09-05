class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :slug, unique: true
      t.timestamps
    end
  end
end
