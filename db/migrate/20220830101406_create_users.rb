class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.date :birthdate
      t.string :address
      t.timestamps
    end
  end
end
