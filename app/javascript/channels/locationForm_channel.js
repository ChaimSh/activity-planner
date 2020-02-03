$(document).ready(function () {
   listenForNewLocationFormClick()
    // editFormListener()
})


function listenForNewLocationFormClick() {
  $('button#ajax-new-location').on('click', function (event) {
      event.preventDefault()
      let newLocationForm = Location.newLocationForm()
      document.querySelector('div#new-location-form-div').innerHTML = newLocationForm
  })
}

class Location {
  static newLocationForm() {
    return (`
		<strong>New Location Form</strong>
			<form>
				<input id='Location-name' type='text' name='name'></input><br>
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