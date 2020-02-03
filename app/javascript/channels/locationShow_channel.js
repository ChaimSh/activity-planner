$(document).ready(function () {
    getLocation()
})


function getLocation() {
    var array = []
    var id = parseInt($("a.location-data").attr("data-id")) + 1;
    $.ajax({
      url: 'http://localhost:3000/locations/' + id,
      method: 'get',
      dataType: 'json',
      success: function (data) {
            array.push(data)
            array.map(location => {
            const newLocation = new Location(location)
            const newLocationHtml = newLocation.locationHTML()
            $('a.location-data').on('click', function(e) {
                e.preventDefault();
            document.getElementById('location-div').innerHTML = newLocationHtml
            $(".location-data").attr("data-id", location.id);
            getLocation()
          }) 
        })
      }
    })
}


// function getLocation() {
//        var array = []
//     var id = parseInt($("a.location-data").attr("data-id")) + 1;
//   fetch('http://localhost:3000/locations/' + id + '.json')
//   .then(function(data) { 
//          array.push(data)
//           array.map(location => {
//           const newLocation = new Location(location)
//           const newLocationHtml = newLocation.locationHTML()
//              $('a.location-data').on('click', function(e) {
//              e.preventDefault();
//           document.getElementById('location-div').innerHTML = newLocationHtml
//       })
//     }) 
//   }) 
// }




class Location {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.address = obj.address
        this.events = obj.events
    }
}

Location.prototype.locationHTML = function () {
    
    let locationEvents = this.events.map(event =>{
        return (`
          <p>${event.name}</p>
        `)
    }).join('')
    
    
    
    return (`
    <div class = location>
    <h1>${this.name}</h1>
    <h2>${this.address}</h2>
    <br>
    <h2>Events By This Location:<h2>
    <h3>${locationEvents}</h3>
    </div>
    `)
}