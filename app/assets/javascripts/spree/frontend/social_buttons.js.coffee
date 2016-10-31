Spree.ready ($) ->
  Spree.socialButtons = ->
    $('.social-share-button > a').on 'click', (e) ->
      e.preventDefault()
      share $(this)

    openUrl = (url, popup) ->
      if popup == 'true'
        window.open(url, 'popup', 'height=500, width=500')
      else
        window.open(url)
        false

    setInfo = ($el) ->
      {
        site: $el.data('site')
        appkey: $el.data('appkey') || ''
        title: encodeURIComponent($el.data('title') || '')
        img: encodeURIComponent($el.data('img') || '')
        url: encodeURIComponent($el.data('url') || '')
        via: encodeURIComponent($el.data('via') || '')
        desc: encodeURIComponent($el.data('desc') || ' ')
        popup: encodeURIComponent($el.data('popup') || 'false')
      }

    share = (el) ->
      info = setInfo $(el).parent()

      if info.url.length == 0
        info.url = encodeURIComponent(location.href)

      switch info.site
        when 'twitter'
          openUrl("https://twitter.com/intent/tweet?url=#{info.url}&text=#{info.title}#{info.via}", info.popup)
        when 'facebook'
          openUrl("http://www.facebook.com/sharer.php?u=#{info.url}", info.popup)
      false

  Spree.socialButtons()