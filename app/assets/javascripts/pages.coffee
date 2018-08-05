# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#myCarousel').on 'slide.bs.carousel', (e) ->
    $e = $(e.relatedTarget)
    idx = $e.index()
    itemsPerSlide = 3
    totalItems = $('.carousel-item').length
    if idx >= totalItems - (itemsPerSlide - 1)
      it = itemsPerSlide - (totalItems - idx)
      i = 0
      while i < it
        # append slides to end
        if e.direction == 'left'
          $('.carousel-item').eq(i).appendTo '.carousel-inner'
        else
          $('.carousel-item').eq(0).appendTo $(this).find('.carousel-inner')
        i++
    return
  return
