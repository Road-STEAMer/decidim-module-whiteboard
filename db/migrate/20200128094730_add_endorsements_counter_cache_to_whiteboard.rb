# frozen_string_literal: true

class AddEndorsementsCounterCacheToWhiteboard < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_whiteboard_iframes, :endorsements_count, :integer, null: false, default: 0
  end
end
