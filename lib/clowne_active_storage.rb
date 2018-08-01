require 'clowne'
require 'active_record'
require 'clowne/adapters/active_record'

require 'clowne_active_storage/version'
require 'clowne_active_storage/declarations/include_attached'
require 'clowne_active_storage/resolvers/attachment_association'

Clowne::Declarations.add :include_attached do |*names|
  names.each do |name|
    decl = ClowneActiveStorage::Declarations::IncludeAttached.new name
    declarations.push decl
  end
end

Clowne::Adapters::ActiveRecord.register_resolver(
  :attachment_association,
  ClowneActiveStorage::Resolvers::AttachmentAssociation,
  after: :nullify
)
