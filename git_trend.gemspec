# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_trend/version'

Gem::Specification.new do |spec|
  spec.name          = "git_trend"
  spec.version       = GitTrend::VERSION
  spec.authors       = ["Smulligan85"]
  spec.email         = ["sean.mulligan85@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = "GitHub scraping gem"
  spec.description   = "See What's Trending on Github in Your Terminal"
  spec.homepage      = "https://github.com/Smulligan85/Git_Trend"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   << 'git-trend'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "colorize"
end
