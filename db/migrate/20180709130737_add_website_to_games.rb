# frozen_string_literal: true

class AddWebsiteToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :website, :string
  end
end
