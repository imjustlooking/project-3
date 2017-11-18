$(document).on('turbolinks:load', function () {
  var defaultText = 'Click me and enter some text';

  function endEdit(e) {
      var input = $(e.target),
          label = input && input.prev();

      label.text(input.val() === '' ? defaultText : input.val());
      input.hide();
      label.show();
  }

  $('.clickedit').hide()
  .focusout(endEdit)
  .keyup(function (e) {
      if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
          endEdit(e);
          return false;
      } else {
          return true;
      }
  })
  .prev().click(function () {
      $(this).hide();
      $(this).next().show().focus();
  });

  var $list_master = $('#list_master')

  // $list_master.change(function(){
    // $list_master.children().eq(2).attr('selected', 'selected')
    // $('.list_slave').val($list_master.val())
    // $('.list_slave').children().eq(3).attr('selected', 'selected')
  // })


});
