module SpreeSocialButtons
  PROVIDERS = [
    %w(Facebook facebook true),
    %w(Twitter twitter false)
  ]

  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_social_buttons'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end

  # Setup all social providers
  def self.init_provider(provider)
    return unless ActiveRecord::Base.connection.table_exists?('spree_social_methods')
    key, secret = nil
    Spree::SocialMethod.where(environment: ::Rails.env).each do |social_method|
      next unless social_method.provider == provider
      key = social_method.api_key
      secret = social_method.api_secret
      Rails.logger.info("[Spree Social Buttons] Loading #{social_method.provider.capitalize} as authentication source")
    end
  end
end
