# frozen_string_literal: true

class AddFollowableCounterCacheToWhiteboard < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_whiteboard_iframes, :follows_count, :integer, null: false, default: 0, index: true

    reversible do |dir|
      dir.up do
        Decidim::Whiteboard::Post.reset_column_information
        Decidim::Whiteboard::Post.find_each do |record|
          record.class.reset_counters(record.id, :follows)
        end
      end
    end
  end
end
