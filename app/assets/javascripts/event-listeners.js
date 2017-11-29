function addTruckBtn(){
  $('#add-truck-btn').click(function(){
    if( $('#truck-create-form').hasClass('show') ) {
      $(this).html('+')
    } else {
      $(this).html('-')
    }
  })
}
