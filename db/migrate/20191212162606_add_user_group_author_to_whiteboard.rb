# frozen_string_literal: true

class AddUserGroupAuthorToWhiteboard < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_whiteboard_iframes, :decidim_user_group_id, :integer
  end
end
