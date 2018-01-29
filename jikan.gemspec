
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jikan/version"

Gem::Specification.new do |spec|
  spec.name          = "jikan.rb"
  spec.version       = Jikan::VERSION
  spec.authors       = ["Zerocchi"]
	spec.email         = ["slaveration@gmail.com"]

	spec.summary       = %q{A simple Ruby wrapper for jikan.me API.}
  spec.description   = %q{This is a wrapper for unofficial MyAnimeList API, Jikan.me. 
                        Consult Jikan.me documentation to learn more. }
	spec.homepage      = "https://github.com/Zerocchi/jikan.rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

	spec.add_runtime_dependency "http", "~> 3.0.0"

  spec.add_development_dependency "bundler", "~> 1.16"
	spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
