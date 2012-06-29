# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ar-serialize-helpers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Caius Durling"]
  gem.email         = ["caius@emberads.com"]
  gem.description   = %q{Helpers for ActiveRecord's serialize in rails 3}
  gem.summary       = %q{Helpers for ActiveRecord's serialize in rails 3}
  gem.homepage      = "http://github.com/EmberAds/ar-serialize-helpers"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ar-serialize-helpers"
  gem.require_paths = ["lib"]
  gem.version       = ARSerializeHelpers::VERSION

  gem.add_development_dependency "json"
  gem.add_development_dependency "activesupport"
  gem.add_development_dependency "rspec"
end
