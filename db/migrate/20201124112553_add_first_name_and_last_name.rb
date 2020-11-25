class AddFirstNameAndLastName < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :first_name, :string
    add_column :articles, :last_name, :string
  end
end
