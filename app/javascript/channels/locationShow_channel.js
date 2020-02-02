$(document).ready(function () {
    locationListener()
    getLocation()
})

function locationListener() {
  $('a.location-data').on('click', function(e) {
      e.preventDefault();
      getLocation()
  })
}

function getLocation() {
    var id = parseInt($("a.location-data").attr("data-id")) + 1;
  fetch('http://localhost:3000/locations/' + id + '.json')
  .then(function(data) { 
     return Object.keys(data).map(location => {
          const newLocation = new Location(location)
          const newLocationHtml = newLocation.locationHTML()
          document.getElementById('location-div').innerHTML = newLocationHtml
      })
  }) 
}

class Location {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.address = obj.address
    }
}

Location.prototype.locationHTML = function () {
    return (`
    <div class = location>
    <h3>${this.name}</h3>
    <h5>${this.address}</h5>
    </div>
    `)
}