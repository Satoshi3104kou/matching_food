class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :way
      t.integer :motivation
      t.integer :wards
      t.integer :table
      t.integer :people
      t.integer :time
      t.references :genre
      t.integer :way
      t.string  :service
    end

  #   create_table :genres do |t|
  #     t.string :name
  #     t.string :ancestry
  #     t.timestamps
  #   end
  #   add_index :genres, :ancestry
  end
end
