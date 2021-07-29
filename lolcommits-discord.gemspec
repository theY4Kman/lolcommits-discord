lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lolcommits/discord/version'

Gem::Specification.new do |spec|
  spec.name        = "lolcommits-discord"
  spec.version     = Lolcommits::Discord::VERSION
  spec.authors     = ["Zach Kanzler"]
  spec.email       = ["they4kman@gmail.com"]
  spec.summary     = %q{Sends lolcommits to one (or more) Discord channels}
  spec.homepage    = "https://github.com/theY4Kman/lolcommits-discord"
  spec.license     = "LGPL-3.0"
  spec.description = %q{Automatically post your lolcommits to Slack}

  spec.metadata = {
    "homepage_uri"      => "https://github.com/theY4Kman/lolcommits-discord",
    "changelog_uri"     => "https://github.com/theY4Kman/lolcommits-discord/blob/master/CHANGELOG.md",
    "source_code_uri"   => "https://github.com/theY4Kman/lolcommits-discord",
    "bug_tracker_uri"   => "https://github.com/theY4Kman/lolcommits-discord/issues",
    "allowed_push_host" => "https://rubygems.org"
  }

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|features)/}) }
  # spec.test_files    = `git ls-files -- {test,features}/*`.split("\n")
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4"

  spec.add_runtime_dependency "discordrb-webhooks", ">= 3.4.2"
  spec.add_runtime_dependency "lolcommits", ">= 0.14.2"

  # spec.add_development_dependency "webmock"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  # spec.add_development_dependency "minitest"
  # spec.add_development_dependency "simplecov"
end
