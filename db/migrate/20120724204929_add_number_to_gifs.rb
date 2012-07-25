class AddNumberToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :number, :string
  end
end
