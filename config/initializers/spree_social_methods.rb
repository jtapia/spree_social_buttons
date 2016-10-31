SpreeSocialButtons::PROVIDERS.each do |provider|
  SpreeSocialButtons.init_provider(provider[1])
end