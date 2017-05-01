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


  // Square Feet to Square Meters on show
   $('.dt sqFeet').on('click', '.sqFeet', function(event) {
     let sqFeet = $(this).data("sqfeet")
     let sqMeters = (sqFeet * 0.0929).toFixed(2)
     console.log(`The value is ${sqMeters}`)
     $(this).replaceWith( `<dd class="sqMeters" data-sqfeet="${sqFeet}">${sqMeters} Square Meters</dd>` )
   })

   // Square Meters to Square Feet on show
   $('.dt').on('click', '.sqMeters', function(event) {
     let sqFeet = $(this).data("sqfeet")
     console.log(`The value is ${sqFeet}`)
     $(this).replaceWith( `<dd class="sqFeet" data-sqfeet="${sqFeet}">${sqFeet} Square Feet</dd>` )
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
