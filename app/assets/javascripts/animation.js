$(document).on('turbolinks:load', function () {
  // for shopping list name change under shoppinglists show view
  var defaultText = 'Click me and enter some text'
  function endEdit (e) {
    var input = $(e.target),
      label = input && input.prev()

    label.text(input.val() === '' ? defaultText : input.val())
    input.hide()
    label.show()
  }
  $('.clickedit').hide()
  .focusout(endEdit)
  .keyup(function (e) { // pressing enter does a callback
    if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
      endEdit(e)
      return false
    } else {
      return true
    }
  })
  .prev().click(function () {
    $(this).hide()
    $(this).next().show().focus()
  })
  // for shopping list item preview under shoppinglists index view
  $('.flipping').on('click', function () {
    var $card = $(this).closest('.card-container')
    console.log($card)
    if ($card.hasClass('hover')) {
      $card.removeClass('hover')
    } else {
      $card.addClass('hover')
    }
  })
})
