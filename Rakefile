# frozen_string_literal: true

require "bundler"
require "bundler/setup"
require "bundler/gem_tasks"

require "rdoc/task"
RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.title = "minitest-rg"
  rdoc.markup = "tomdoc"
  rdoc.rdoc_files.include "README.md", "lib/**/*.rb"
  rdoc.rdoc_dir = "doc"
end

require "rubocop/rake_task"
RuboCop::RakeTask.new

require "rake/testtask"
desc "Run tests."
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/test_*.rb"]
  t.warning = false
  t.verbose = false
end

desc "Run all test type scripts"
task :sanity do
  puts "=" * 72
  puts "Running a \e[32mpassing\e[0m test:"
  puts "=" * 72
  puts
  puts capture_output("pass")
  puts

  puts "=" * 72
  puts "Running a \e[31mfailing\e[0m test:"
  puts "=" * 72
  puts
  puts capture_output("fail")
  puts

  puts "=" * 72
  puts "Running a \e[33merroring\e[0m test:"
  puts "=" * 72
  puts
  puts capture_output("error")
  puts

  puts "=" * 72
  puts "Running a \e[36mskipped\e[0m test:"
  puts "=" * 72
  puts
  puts capture_output("skip")
  puts
end

def capture_output command
  os = `uname -s`.chomp
  if os.include?("BSD") || os.include?("Darwin")
    `script -q /dev/null ./scripts/run_#{command}`
  else
    `script -q -c ./scripts/run_#{command} /dev/null`
  end
end

task default: %i[test rubocop]
