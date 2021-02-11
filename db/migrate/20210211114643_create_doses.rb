class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.string :cocktails
      t.string :ingredient
      t.text :description

      t.timestamps
    end
  end
end
