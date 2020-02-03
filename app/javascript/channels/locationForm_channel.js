$(document).ready(function () {
   listenForNewPostFormClick()
    // editFormListener()
})


function listenForNewFormClick() {
  $('button#ajax-new-location').on('click', function (event) {
      event.preventDefault()
      let newLocationForm = Location.newPostForm()
  })
}

class Location {
  static newlocationForm() {
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