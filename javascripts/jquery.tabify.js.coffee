(($) ->
  $.Tabify = (el, options) ->
    base = this
    base.$el = $(el)
    base.el = el
    base.$el.data "Tabify", base
    base.init = ->
      base.options = $.extend({}, $.Tabify.defaultOptions, options)
      base.$el.on "click", ".tabs .tab a", (e)=>
        e.preventDefault()
        $target = $(e.target)
        if $target.is('a')
          base.$el.find('.message').hide()
          $("#{$target.attr('href')}").show()
          base.$el.find('.active').removeClass('active')
          $target.parent().addClass('active')

    base.init()

  $.Tabify.defaultOptions = {}
  $.fn.tabify = (options) ->
    @each ->
      new $.Tabify(this, options)


  $.fn.getTabify = ->
    @data "Tabify"
) jQuery