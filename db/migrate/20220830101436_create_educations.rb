class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.belongs_to :user, index: true
      t.string :nameofeducation
      t.integer :marks 
      t.integer :percentage
      t.integer :passingout
      t.string :branch  
      t.timestamps
    end
  end
end
