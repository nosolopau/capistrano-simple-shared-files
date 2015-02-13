lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'capistrano-simple-shared-files'
  s.version       = '0.1.0'
  s.summary       = 'Upload files and directories to shared directory.'
  s.description   = 'Adds tasks to upload files and directories to shared directory.'

  s.authors       = ['Pablo Torrecilla']
  s.email         = ['pau@nosolopau.com']
  s.homepage      = 'https://github.com/nosolopau/capistrano-simple-shared-files'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']

  s.add_dependency 'capistrano', '~> 3.1'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end
