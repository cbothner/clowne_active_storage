require 'clowne'

require 'clowne_active_storage/version'
require 'clowne_active_storage/declarations/include_attached'

Clowne::Declarations.add :include_attached do |*names|
  names.each do |name|
    decl = ClowneActiveStorage::Declarations::IncludeAttached.new name
    declarations.push decl
  end
end
