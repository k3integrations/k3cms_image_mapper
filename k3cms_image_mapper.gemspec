# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "k3cms/image_mapper/version"

Gem::Specification.new do |s|
  s.name        = "k3cms_image_mapper"
  s.summary       = %q{K3cms Image Map Editor extension}
  s.description   = s.summary
  s.homepage      = "http://k3cms.org/#{s.name}"

  s.authors       = `git shortlog --summary --numbered         | awk '{print $2, $3    }'`.split("\n")
  s.email         = `git shortlog --summary --numbered --email | awk '{print $2, $3, $4}'`.split("\n")

  s.add_dependency 'facets'
  s.add_dependency 'rails',        '~> 3.0.0'
  s.add_dependency 'activerecord', '~> 3.0.0'
  s.add_dependency 'actionpack',   '~> 3.0.0'
  s.add_dependency 'k3cms_core'
  s.add_dependency 'k3cms_inline_editor'
  s.add_dependency 'k3cms_ribbon' # for edit_mode?
  s.add_dependency 'cells'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.version       = K3cms::ImageMapper::Version
  s.platform      = Gem::Platform::RUBY
end
