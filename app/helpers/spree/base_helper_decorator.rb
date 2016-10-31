Spree::BaseHelper.module_eval do
  def social_share_button_tag(type = '', opts = {})
    data_attributes = {}
    data_attributes.store('title', type)
    data_attributes.store('site', type)
    data_attributes.store('img', opts[:image]) if opts[:image]
    data_attributes.store('url', opts[:url]) if opts[:url]
    data_attributes.store('desc', opts[:desc]) if opts[:desc]
    data_attributes.store('popup', opts[:popup]) if opts[:popup]
    data_attributes.store('via', opts[:via]) if opts[:via]
    data_attributes.store('width', opts[:width]) if opts[:width]
    data_attributes.store('height', opts[:height]) if opts[:height]

    content_tag(:div, class: 'social-share-button', data: data_attributes) do |div|
      link_to(opts[:text] || '', '#', class: "social-share-button-#{type} #{opts[:inner_class]}", rel: ['nofollow', opts[:rel]])
    end
  end
end
