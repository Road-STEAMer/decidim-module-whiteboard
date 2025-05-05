# frozen_string_literal: true

class AddAuthorToDecidimWhiteboardIframes < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_whiteboard_iframes, :decidim_author_id, :integer, index: true
  end
end
