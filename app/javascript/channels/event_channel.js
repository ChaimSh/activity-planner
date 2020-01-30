$(document).ready(function () {
    listenForClick()
})

function listenForClick() {
    $('button#event-data').on('click', function (e) {
        e.preventDefault()
        getEvents()
    })
}

function getEvents(){
    $.ajax({
      url: 'http://localhost:3000/events',
      method: 'get',
      dataType: 'json',
      success: function (data) {
        data.map(event => {
            const newEvent = new Event(event)
            const newEventHtml = newEvent.eventHTML()
            document.getElementById('ajax-event-' + newEvent.id).innerHTML = newEventHtml
        })   
      }
    })
}

class Event {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.date = obj.date
    }
}

Event.prototype.eventHTML = function () {
    return (`
    <div class='event'>
    <h3>${this.name}</h3>
    <h5>${this.date}</h5>
    </div>
    `)
}