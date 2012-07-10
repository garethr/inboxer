#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc "Run rspec tests"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
  t.rspec_opts = "--color --format documentation"
end

desc "Run rspec tests"
task :default => [:spec]
