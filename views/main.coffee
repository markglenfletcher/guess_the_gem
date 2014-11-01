$ ->
  $('.guess-letter-list .unguessed').bind 'click', (e) ->
    data_id = $(this).attr('data-id')
    jem = $(this).closest 'article.jem' 
    letter_list = $(jem).find 'ul.name-letter-list'
    letters = $(letter_list).find "li[data-id=#{data_id}]"
    $(letters).removeClass 'hidden'
    $(this).addClass 'guessed'
    $(this).removeClass 'unguessed'