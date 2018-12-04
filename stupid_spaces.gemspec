
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stupid_spaces/version"

Gem::Specification.new do |spec|
  spec.name          = "stupid_spaces"
  spec.version       = StupidSpaces::VERSION
  spec.authors       = ["Eustaquio Rangel"]
  spec.email         = ["eustaquiorangel@gmail.com"]

  spec.summary       = %q{Remove leading and trailing spaces from ActiveRecord string attributes}
  spec.description   = %q{Remove leading and trailing spaces from ActiveRecord string attributes}
  spec.homepage      = 'http://github.com/taq/stupid_spaces'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'active_record', '~> 5.0'

  spec.signing_key = '/home/taq/.gemcert/gem-private_key.pem'
  spec.cert_chain  = ['gem-public_cert.pem']
end
