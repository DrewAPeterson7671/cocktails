class AddForeignKeyForCocktails < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :cocktails, :users
  end
end
