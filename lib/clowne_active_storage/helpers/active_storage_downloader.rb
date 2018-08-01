# frozen_string_literal: true

# Imported from the future
# https://github.com/rails/rails/commit/ee21b7c2eb64def8f00887a9fafbd77b85f464f1#diff-c76fb6202b7f95a08fe12f40c4999ac9
class ActiveStorageDownloader
  attr_reader :blob, :tempdir
  def initialize(blob, tempdir: nil)
    @blob    = blob
    @tempdir = tempdir
  end

  def download_blob_to_tempfile
    open_tempfile do |file|
      download_blob_to file
      verify_integrity_of file
      yield file
    end
  end

  private

  def open_tempfile
    file = Tempfile.open(
      ["ActiveStorage-#{blob.id}-", blob.filename.extension_with_delimiter],
      tempdir
    )

    begin
      yield file
    ensure
      file.close!
    end
  end

  def download_blob_to(file)
    file.binmode
    blob.download { |chunk| file.write(chunk) }
    file.flush
    file.rewind
  end

  def verify_integrity_of(file)
    return if Digest::MD5.file(file).base64digest == blob.checksum
    raise ActiveStorage::IntegrityError
  end
end
