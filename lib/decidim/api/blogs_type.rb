# frozen_string_literal: true

module Decidim
  module Whiteboard
    class WhiteboardType < Decidim::Api::Types::BaseObject
      implements Decidim::Core::ComponentInterface

      graphql_name "whiteboard"
      description "A whiteboard component of a participatory space."

      field :posts, type: Decidim::Whiteboard::PostType.connection_type, description: "List all posts", connection: true, null: false do
        argument :order, Decidim::Whiteboard::PostInputSort, "Provides several methods to order the results", required: false
        argument :filter, Decidim::Whiteboard::PostInputFilter, "Provides several methods to filter the results", required: false
      end

      field :post, type: Decidim::Whiteboard::PostType, description: "Finds one post", null: true do
        argument :id, GraphQL::Types::ID, "The ID of the post", required: true
      end

      def posts(filter: {}, order: {})
        base_query = Decidim::Core::ComponentListBase.new(model_class: Post).call(object, { filter:, order: }, context)
        if context[:current_user]&.admin?
          base_query
        else
          base_query.published
        end
      end

      def post(id:)
        scope =
          if context[:current_user]&.admin?
            Post
          else
            Post.published
          end

        Decidim::Core::ComponentFinderBase.new(model_class: scope).call(object, { id: }, context)
      end
    end
  end
end
