lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'dokuen-solo/version'

Gem::Specification.new do |gem|
  gem.name = "dokuen-solo"
  gem.version = Dokuen::Solo::VERSION
  gem.authors = ["Pete Keen"]
  gem.email = ["pete@bugsplat.info"]
  gem.description = %q{Deploy applications using heroku-style buildpacks to remote servers}
  gem.summary = %q{Deploy applications using heroku-style buildpacks to remote servers}
  gem.homepage = "https://github.com/peterkeen/dokuen-solo"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("capistrano")
end
