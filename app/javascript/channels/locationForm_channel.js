const ready = (callback => {
  if (document.readyState != "loading") callback();
  else document.addEventListener("DOMContentLoaded", callback);
})


ready(() => {
  document.getElementById("new-location-button").addEventListener("click", (e) => {
      e.preventDefault()
      let url = "locations/new" 
      const mainContainer = document.querySelector("#location-form-placeholder")
      return fetch(url)
      .then(response => response.text())
      .then(data => {
        const z = document.createElement('div');
        z.innerHTML = data;
        mainContainer.appendChild(z);
        document.getElementById("new-location-button").style.display = "none"
      })  
  }); 
})








class Location {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name,
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


// // $(document).ready(function () {
// //     newLocationFormListener()
// //     createNewLocation()
// //     // editFormListener()
// $( newLocation = () => {
//     $('form#location_form').on('submit', function(e) {
//     e.preventDefault();
//     const values = $(this).serialize();
//     const postResp = $.post('/locations', values, );
//     postResp.done((respData) => {
//       console.log(respData)
//     var location = new Location(respData);
//     const newHtml = location.newLocationHTML();
//     $('#js-location-info')
//     .append(newHtml)
//     .addClass('open-up');
//     // }).error((respData) => {
//     //   let errorMessage = 'There was an error: Title ';
//     //   errorMessage += respData.responseJSON.title['0'];
//     //   $('#js-location-info').html(errorMessage)
//     //       .addClass('open-up-error');
//       });
//     });
//   // $('form').submit();
// });


