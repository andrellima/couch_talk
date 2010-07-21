# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{couch_foo}
  s.version = "0.8.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George Palmer"]
  s.date = %q{2010-03-02}
  s.description = %q{CouchFoo provides an ActiveRecord API interface to CouchDB}
  s.email = %q{george.palmer@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "couch_foo.gemspec",
     "features/couch_foo.feature",
     "features/steps/couch_foo_steps.rb",
     "features/support/env.rb",
     "lib/boolean.rb",
     "lib/couch_foo.rb",
     "lib/couch_foo/associations.rb",
     "lib/couch_foo/associations/association_collection.rb",
     "lib/couch_foo/associations/association_proxy.rb",
     "lib/couch_foo/associations/belongs_to_association.rb",
     "lib/couch_foo/associations/belongs_to_polymorphic_association.rb",
     "lib/couch_foo/associations/has_and_belongs_to_many_association.rb",
     "lib/couch_foo/associations/has_many_association.rb",
     "lib/couch_foo/associations/has_one_association.rb",
     "lib/couch_foo/attribute_methods.rb",
     "lib/couch_foo/base.rb",
     "lib/couch_foo/calculations.rb",
     "lib/couch_foo/callbacks.rb",
     "lib/couch_foo/database.rb",
     "lib/couch_foo/database_version.rb",
     "lib/couch_foo/dirty.rb",
     "lib/couch_foo/named_scope.rb",
     "lib/couch_foo/observer.rb",
     "lib/couch_foo/reflection.rb",
     "lib/couch_foo/serialization.rb",
     "lib/couch_foo/serializers/json_serializer.rb",
     "lib/couch_foo/serializers/xml_serializer.rb",
     "lib/couch_foo/timestamp.rb",
     "lib/couch_foo/validations.rb",
     "lib/couch_foo/view_methods.rb",
     "test/couch_foo_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/georgepalmer/couch_foo}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{CouchFoo provides an ActiveRecord API interface to CouchDB}
  s.test_files = [
    "test/couch_foo_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<couchrest>, [">= 0.9.12"])
      s.add_runtime_dependency(%q<uuid>, [">= 2.0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<couchrest>, [">= 0.9.12"])
      s.add_dependency(%q<uuid>, [">= 2.0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<couchrest>, [">= 0.9.12"])
    s.add_dependency(%q<uuid>, [">= 2.0"])
  end
end