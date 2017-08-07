// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  //favoriting
  $('.clickable-heart').on('click', function(event) {
    let isFavorited = $(this).hasClass('clicked')

    $(this).toggleClass('clicked')
    let homeId = $(this).data("home-id")

    let url = isFavorited ? `/homes/${homeId}/unfavorite` : `/homes/${homeId}/favorite`

    $.ajax({
      method: 'POST',
      url: url,
      data: { homeId: homeId},
      dataType: 'script'
    })
  })


  // Square Feet to Square Meters on show
   $('body').on('click', '.sqFeet', function(event) {
     let sqFeet   = $(this).data('sqfeet')
     let sqMeters = $(this).data('sqmeters')

     if ($(this).data('showing-meters') === 'true') {
       $(this).text(`${sqFeet} Square Feet`)
       $(this).data('showing-meters', 'false')
     } else {
       $(this).text(`${sqMeters} Square Meters`)
       $(this).data('showing-meters', 'true')
     }
   })

   // dynamic search
   $('#query').on('input', function(event) {
     let queryValue = $(this).val()

     console.log(`You are searching for ${queryValue}`)

     $.ajax({
       url: '/homes',
       data: { query: queryValue},
       dataType: 'script'
     })
   })

   // AJAX and pagination and you.
   $('.page').on('click', function(event) {
     let page = $(this).val()

     console.log(page)
   })



})
