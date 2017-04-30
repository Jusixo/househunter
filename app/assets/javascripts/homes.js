// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {


  $('.clickable-heart').on('click', function(event) {
    $(this).css({ color: "red" })
        let homeId = $(this).data("homeid")
        console.log(`The value is ${homeId}`)
      })

      $('.clickable-heart').off('click', '.fav-heart', function(event) {
        $('.fav-heart').off("click");
      })


    $.ajax({
      url: '/homes',
      data: { query: home_id},
      dataType: 'script'
    })

  })




  $('#query').on('input', function(event) {
    let queryValue = $(this).val()

    console.log(`You are searching for ${queryValue}`)

    $.ajax({
      url: '/homes',
      data: { query: queryValue},
      dataType: 'script'
    })
  })

  $('.page').on('click', function(event) {
    let page = $(this).val()

    console.log(page)
  })






})
