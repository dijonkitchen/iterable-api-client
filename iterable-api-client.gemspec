Gem::Specification.new do |s|
  s.name                  = 'iterable-api-client'
  s.version               = '0.3.1'
  s.date                  = '2020-05-11'
  s.summary               = 'Iterable REST API Client'
  s.description           = 'Ruby gem for the Iterable REST API'
  s.licenses              = %w[MIT]
  s.authors               = %w[Chavez]
  s.email                 = 'contact@el-chavez.me'
  s.files                 = Dir.glob('{bin,lib}/**/*') + %w[README.md]
  s.require_paths         = %w[lib]
  s.homepage              = 'http://gitlab.com/mtchavez/iterable'
  s.rdoc_options          = %w[--charset=UTF-8 --main=README.md]
  s.extra_rdoc_files      = %w[README.md]
  s.required_ruby_version = '>= 2.4.0'
  s.cert_chain            = %w[certs/mtchavez.pem]
  s.signing_key           = File.join(Gem.user_home, '.ssh', 'gem-private_key.pem') if $PROGRAM_NAME.end_with?('gem')

  # Runtime dependencies
  s.add_dependency 'multi_json', '>= 1.12.0'

  # Dev Dependencies
  s.add_development_dependency 'coveralls',  '~> 0.8.21'
  s.add_development_dependency 'dotenv',     '~> 2.2.0'
  s.add_development_dependency 'gemcutter',  '~> 0.7.1'
  s.add_development_dependency 'multi_json', '~> 1.12.1'
  s.add_development_dependency 'pry',        '~> 0.10.4'
  s.add_development_dependency 'pry-byebug', '~> 3.4.2'
  s.add_development_dependency 'pry-doc',    '~> 0.11.1'
  s.add_development_dependency 'rake',       '~> 12.0.0'
  s.add_development_dependency 'redcarpet',  '~> 3.4.0'
  s.add_development_dependency 'rspec',      '~> 3.6.0'
  s.add_development_dependency 'rubocop',    '~> 0.89.1'
  s.add_development_dependency 'simplecov',  '~> 0.14.1'
  s.add_development_dependency 'typhoeus',   '~> 1.4.0'
  s.add_development_dependency 'vcr',        '~> 3.0.3'
  s.add_development_dependency 'webmock',    '~> 3.8.3'
  s.add_development_dependency 'yard',       '~> 0.9.5'
end
