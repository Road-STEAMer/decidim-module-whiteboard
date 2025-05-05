# frozen_string_literal: true

module Decidim
  module Whiteboard
    # A cell to display when a post has been created.
    class PostActivityCell < ActivityCell
      def title
        I18n.t("decidim.whiteboard.last_activity.new_post")
      end
    end
  end
end
