# frozen_string_literal: true

require "rails"
require "active_support/all"

require "decidim/core"

module Decidim
  module Whiteboard
    # This is the engine that runs on the public interface of `decidim-whiteboard`.
    # It mostly handles rendering the created whiteboard associated to a participatory
    # process.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Whiteboard

      routes do
        resources :posts, only: [:index, :show]
        scope "/posts" do
          root to: "posts#index"
        end
        get "/", to: redirect("posts", status: 301)
      end

      initializer "decidim_whiteboard.register_icons" do
        Decidim.icons.register(name: "Decidim::Whiteboard::Post", icon: "artboard-line", description: "whiteboard post", category: "activity", engine: :core)
      end

      initializer "decidim_whiteboard.add_cells_view_paths" do
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::Whiteboard::Engine.root}/app/cells")
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::Whiteboard::Engine.root}/app/views") # for partials
      end

      initializer "decidim_whiteboard.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end

      initializer "decidim_whiteboard.authorization_transfer" do
        config.to_prepare do
          Decidim::AuthorizationTransfer.register(:whiteboard) do |transfer|
            transfer.move_records(Decidim::Whiteboard::Post, :decidim_author_id)
          end
        end
      end
    end
  end
end
