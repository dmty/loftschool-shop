$ '.content__options-select'
  .on 'change', ->
    $this = $ this
    list = $ '.content__list'
    view = do $this.val
    list.addClass 'content__list_horizontal' if view == 'cells'
    list.removeClass 'content__list_horizontal' if view == 'lines'
