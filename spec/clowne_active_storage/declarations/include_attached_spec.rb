RSpec.describe ClowneActiveStorage::Declarations::IncludeAttached do
  describe '#compile' do
    it 'adds an attachment association step to the plan' do
      decl = described_class.new 'file'
      plan = spy

      decl.compile plan

      expect(plan).to have_received(:set).with(:attachment_association, decl)
    end
  end
end
