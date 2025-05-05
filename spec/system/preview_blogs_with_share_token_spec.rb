# frozen_string_literal: true

require "spec_helper"

describe "Preview whiteboard with share token" do
  let(:manifest_name) { "whiteboard" }

  include_context "with a component"
  it_behaves_like "preview component with share_token"
end
