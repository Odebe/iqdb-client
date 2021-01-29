require_relative 'lib/iqdb/client/version'

Gem::Specification.new do |spec|
  spec.name          = "iqdb-client"
  spec.version       = Iqdb::Client::VERSION
  spec.authors       = ["Mihail 'Odebe' Dmitriev"]
  spec.email         = ["derpiranha@gmail.com"]

  spec.summary       = %q{IQDB adapter}
  spec.homepage      = "https://github.com/Odebe/iqdb-client"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Odebe/iqdb-client"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.require_paths = ["lib"]
end
