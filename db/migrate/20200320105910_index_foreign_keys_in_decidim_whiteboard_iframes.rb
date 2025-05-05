# frozen_string_literal: true

class IndexForeignKeysInDecidimWhiteboardIframes < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_whiteboard_iframes, :decidim_user_group_id
  end
end
