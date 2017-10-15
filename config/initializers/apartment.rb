# require 'apartment/elevators/generic'
require 'apartment/elevators/domain'
# require 'apartment/elevators/subdomain'
# require 'apartment/elevators/first_subdomain'

#
# Apartment Configuration
#
Apartment.configure do |config|
  config.excluded_models = %w[Site]

  config.tenant_names = lambda {
    Site.pluck(:domain).map { |domain| domain.tr('.', '_') }
  }
  config.use_sql = true

  # config.persistent_schemas = %w{ hstore }
end

# Rails.application.config.middleware.use Apartment::Elevators::Domain
# Rails.application.config.middleware.use Apartment::Elevators::Subdomain
# Rails.application.config.middleware.use Apartment::Elevators::FirstSubdomain
Rails.application.config.middleware.use FullHostElevators
