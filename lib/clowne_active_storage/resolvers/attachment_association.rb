# frozen_string_literal: true

module ClowneActiveStorage
  module Resolvers
    # Clone the files attached to source and attach the clones to the record
    class AttachmentAssociation
      def self.call(source, record, declaration, **)
        new(source, record, declaration).call
      rescue Errno::ENOENT
        record
      end

      attr_reader :source, :record, :declaration

      def initialize(source, record, declaration)
        @source = source
        @record = record
        @declaration = declaration
      end

      def call
        return record unless source_association.attached?

        source_association.attachments.each do |attachment|
          open_attached attachment do |tempfile|
            record_association.attach(
              io: tempfile, filename: attachment.filename,
              content_type: attachment.content_type
            )
          end
        end
        record
      end

      private

      def source_association
        source.send declaration.name
      end

      def record_association
        record.send declaration.name
      end

      def open_attached(attached, &blk)
        if attached.respond_to? :open
          attached.open(&blk)
        else
          require 'clowne_active_storage/helpers/active_storage_downloader'
          ActiveStorageDownloader.new(attached).download_blob_to_tempfile(&blk)
        end
      end
    end
  end
end
