class AddReadToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :verify, :boolean
  end
end
