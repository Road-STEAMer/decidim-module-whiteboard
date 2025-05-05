class AddIframeFieldsToDecidimWhiteboardIframes < ActiveRecord::Migration[7.0]
  def change
    add_column :decidim_whiteboard_iframes, :iframe_src, :string
    add_column :decidim_whiteboard_iframes, :iframe_width, :string
    add_column :decidim_whiteboard_iframes, :iframe_height, :integer
  end
end
