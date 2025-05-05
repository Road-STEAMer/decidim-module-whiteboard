# frozen_string_literal: true

class CreateDecidimWhiteboardIframe < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_whiteboard_iframes do |t|
      t.jsonb :title
      t.jsonb :body
      t.references :decidim_component, index: true
      t.timestamps
    end
  end
end
