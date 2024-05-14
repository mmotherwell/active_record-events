require File.expand_path('boot', __dir__)

require 'active_record'

Bundler.require(:default, ENV.fetch('RAILS_ENV', nil))

# Load application files
Dir["#{__dir__}/../app/**/*.rb"].sort.each { |f| require f }

# Load the database configuration
config_file = File.expand_path('database.yml', __dir__)
config = YAML.load_file(config_file)[ENV.fetch('RAILS_ENV', nil)]

ActiveRecord::Base.logger = Logger.new(File::NULL)

ActiveRecord::Base.establish_connection(config)
