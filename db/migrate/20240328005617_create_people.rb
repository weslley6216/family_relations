class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.references :mother, foreign_key: { to_table: :people }
      t.references :father, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
