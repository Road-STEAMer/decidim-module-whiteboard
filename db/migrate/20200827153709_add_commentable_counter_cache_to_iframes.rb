# frozen_string_literal: true

class AddCommentableCounterCacheToIframes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_whiteboard_iframes, :comments_count, :integer, null: false, default: 0, index: true
    Decidim::Whiteboard::Post.reset_column_information
    Decidim::Whiteboard::Post.find_each(&:update_comments_count)
  end
end
