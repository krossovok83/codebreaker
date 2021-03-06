# frozen_string_literal: true

$LOAD_PATH.push File.expand_path(__dir__)

Gem::Specification.new do |spec|
  spec.name = "codebreaker"
  spec.version = "0.1.0"
  spec.authors = ["krossovok83"]
  spec.email = ["81463993+krossovok83@users.noreply.github.com"]

  spec.summary = "summary"
  spec.description = "RubyGarage task"
  spec.homepage = "https://github.com/krossovok83/codebreaker"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/krossovok83/codebreaker"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/krossovok83/codebreaker"
  spec.metadata["changelog_uri"] = "https://github.com/krossovok83/codebreaker/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject do |f|
  #     (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
  #   end
  # end
  spec.files = Dir["lib/**/*"] + %w[LICENSE.txt README.md autoload.rb]
  spec.bindir = "exe"
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.executables = ["codebreaker"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata = {
    "rubygems_mfa_required" => "true"
  }

  spec.add_dependency("fasterer", "~> 0.9.0")
  spec.add_dependency("overcommit", "~> 0.58.0")
  spec.add_dependency("rake", "~> 13.0")
  spec.add_dependency("rubocop", "~> 1.21")
end
