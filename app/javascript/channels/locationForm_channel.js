$(document).ready(function () {
    newLocationFormListener()
    createNewLocation()
    // editFormListener()
})


function newLocationFormListener() {
  $('button#ajax-new-location').on('click', function (event) {
    event.preventDefault()
    let newLocationForm = Location.newLocationForm()
      document.querySelector('div#new-location-form-div').innerHTML = newLocationForm
  })
}


function createNewLocation() {
      $(document).on('submit', 'form#newLocationForm', function(e){
      var values = $(this).serialize();
      var posting =  $.post('/locations', values);
      posting.done(function(data) {
      var location = new Location(data);
      })
    })
}

class Location {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.address = obj.address 
  }
   static newLocationForm() {
     return (`
		  <strong>New Location Form</strong>
      <form>
        Location Name:
				<input id='Location-name' type='text' name='name'></input><br>
        Location Address:
        <input type='text' name='address'></input><br>
				<input type='submit' />
			</form>
		`)
  }
}








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