$(document).ready(function () {
    editFormListener()
})


function editFormListener() {
  $('form.edit_location').on('submit', function(event){
    event.preventDefault();
    updateLocation()
  })  
}

function updateLocation() {
    var values = $(this).serialize();
    var id = parseInt($("a.location-data").attr("data-id"));
}