Gem::Specification.new 'minitest-rg', '5.0.0' do |s|
  s.authors = ["Mike Moore"]
  s.description = "Adds color to your MiniTest output"
  s.summary = "RedGreen for MiniTest"
  s.email = ["mike@blowmage.com"]
  s.files = Dir["lib/**/*.rb"]
  s.homepage = "https://github.com/blowmage/minitest-rg"
  s.licenses = "MIT"
  s.add_runtime_dependency "minitest", "~> 5.0"
end
