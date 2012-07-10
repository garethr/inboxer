# -*- encoding: utf-8 -*-
require File.expand_path('../lib/inboxer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gareth Rushgrove"]
  gem.email         = ["gareth@morethanseven.net"]
  gem.homepage      = 'https://github.com/garethr/inboxer'
  gem.summary       = 'Send web pages to your inbox as html or PDF'
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "inboxer"
  gem.require_paths = ["lib"]
  gem.version       = Inboxer::VERSION

  gem.add_dependency('pony')
  gem.add_dependency('hpricot')
  gem.add_dependency('gli')
  gem.add_dependency('premailer')
  gem.add_dependency('phantomjs.rb')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rdoc')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('webmock')
  gem.add_development_dependency('email_spec')
end
