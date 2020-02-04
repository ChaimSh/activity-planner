// $(document).ready(function () {
//     newLocationFormListener()
//     createNewLocation()
//     // editFormListener()
// })


// function newLocationFormListener() {
//   $('button#ajax-new-location').on('click', function (event) {
//     event.preventDefault()
//     let newLocationForm = Location.newLocationForm()
//       document.querySelector('div#new-location-form-div').innerHTML = newLocationForm
//   })
// }

 
// function createNewLocation() {
//       $('form#new-location-form').on('submit', function(e) {
//       e.preventDefault();
//       var values = $(this).serialize();
//       var posting =  $.post('/locations', values);
//       posting.done(function(data) {
//       var location = new Location(data);
//       var response = location.buildLocation({skipIndexLink: true});
//       $('div#new-locations').html(response);
//       })
//     })
// }

$(() => {
  const handleSubmit = (e) => {
    e.preventDefault();
    const values = $(e.target).serialize();
    console.log('values :', values);
    const postResp = $.post('/locations', values);
    postResp.done((respData) => {
    var location = new Location(respData);
    const newHtml = location.newLocationHTML();
    $('#js-location-info')
    .html(newHtml)
    .addClass('open-up');
    }).error((respData) => {
      let errorMessage = 'There was an error: Title ';
      errorMessage += respData.responseJSON.title['0'];
      $('#js-location-info').html(errorMessage)
          .addClass('open-up-error');
    });
  };
});
$('form').submit(handleSubmit);


class Location {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.address = obj.address 
  }
}

Location.prototype.newLocationHTML = function () {
  return (`
  <div class='location'>
  <h3>${this.name}</h3>
  <h5>${this.address}</h5>
  </div>
  `)
}

//    static newLocationForm() {
//      return (`
// 		  <strong>New Location Form</strong>
//       <form id='new-location-form'>
//         Location Name:
// 				<input id='Location-name' type='text' name='name'></input><br>
//         Location Address:
//         <input type='text' name='address'></input><br>
// 				<input type='submit' />
// 			</form>
// 		`)
//   }
// }








// function editFormListener() {
//   $('form.edit_location').on('submit', function(event){
//     event.preventDefault();
//     updateLocation()
//   })  
// }

// function updateLocation() {
//     var values = $(this).serialize();
//     var id = parseInt($("a.location-data").attr("data-id"));
// }