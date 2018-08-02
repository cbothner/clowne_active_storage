
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clowne_active_storage/version'

Gem::Specification.new do |s|
  s.name = 'clowne_active_storage'
  s.version = ClowneActiveStorage::VERSION
  s.authors = ['Cameron Bothner']
  s.email = ['cameronbothner@gmail.com']

  s.summary = 'Clone ActiveStorage attachment associations with Clowne'
  s.homepage = 'https://github.com/cbothner/clowne_active_storage'
  s.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this section
  # to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'clowne'
  s.add_dependency 'rails'

  s.add_development_dependency 'bundler', '~> 1.16'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
end
