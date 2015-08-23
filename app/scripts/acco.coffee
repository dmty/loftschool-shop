  $('.sidebar__item-trigger').on 'click', (e)->
    e.preventDefault

    $this = $(this)
    item = $this.closest '.sidebar__item'
    items = $this.closest '.sidebar__list'
    content = item.find '.sidebar__inner'
    duration = 300

    if !item.hasClass 'active'
      item.addClass 'active'
      items.find '.sidebar__inner'
        .slideUp duration
      content.stop true, true
        .slideDown duration

    else
      item.removeClass 'active'
      content.stop true, true
        .slideUp duration 
