# frozen_string_literal: true

module ClowneActiveStorage
  module Declarations
    # DSL to add associations to ActiveStorage Attachments and Blobs for single
    # attachments
    class IncludeAttached < ::Clowne::Declarations::Base
      attr_reader :name

      def initialize(name)
        @name = name.to_sym
      end

      def compile(plan)
        plan.set :attachment_association, self
      end
    end
  end
end
