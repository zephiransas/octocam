# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octocam/version'

Gem::Specification.new do |spec|
  spec.name          = "octocam"
  spec.version       = Octocam::VERSION
  spec.authors       = ["Takafumi Yoshida"]
  spec.email         = ["zephiransas@gmail.com"]

  spec.summary       = %q{Generate CHANGELOG with Markdown format from GitHub pull request.}
  spec.description   = %q{Generate CHANGELOG with Markdown format from GitHub pull request.}
  spec.homepage      = 'https://github.com/zephiransas/octocam'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "octokit"
end
