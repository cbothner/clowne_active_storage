RSpec.describe ClowneActiveStorage::Resolvers::AttachmentAssociation do
  let :declaration do
    instance_double 'ClowneActiveStorage::Declarations::IncludeAttached',
                    name: :file
  end

  def attachment(file = nil)
    spy attached?: file.present?,
        attachments: file.present? ? [file] : [],
        attach: nil
  end

  def file
    double(filename: 'file.txt', content_type: 'text/plain').tap do |file|
      allow(file).to receive(:open).and_yield(:tempfile)
    end
  end

  describe '.call' do
    it 'does nothing if there is nothing attached' do
      source = double file: attachment(nil)
      record = double file: attachment(nil)

      result = described_class.call source, record, declaration

      expect(result).to be record
      expect(result.file).not_to have_received :attach
    end

    it 'attaches a copy of the file to the clone', focus: true do
      source = double file: attachment(file)
      record = double file: attachment(nil)

      described_class.call source, record, declaration

      expect(record.file).to have_received(:attach).with(
        io: :tempfile, filename: 'file.txt', content_type: 'text/plain'
      )
    end
  end
end
