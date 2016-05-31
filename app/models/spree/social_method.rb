module Spree
  class SocialMethod < ActiveRecord::Base
    validates :provider, :api_key, :api_secret, presence: true

    def self.active_share_methods?
      where(environment: ::Rails.env, active: true).exists?
    end
  end
end