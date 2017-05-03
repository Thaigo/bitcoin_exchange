$(document).ready ->
  $('form').submit ->
    if $('form').attr('action') == '/bitcoin'
      $.ajax '/bitcoin',
        type: 'POST'
        dataType: 'json'
        data:
          currency: $('#bit_currency').val(),          
          quantity: $('#bit_quantity').val()
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, textStatus, jqXHR) ->
          $('#bit_result').val data.value
      return false
    return