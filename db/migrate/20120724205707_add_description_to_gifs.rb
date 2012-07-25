class AddDescriptionToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :description, :text
  end
end
