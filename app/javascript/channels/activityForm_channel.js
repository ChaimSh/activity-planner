 
        $(document).ready(function() { 
           AcitivityButtonListener(); 

        }); 

        function AcitivityButtonListener() {
           $('#activity-form-button').on('click', function(e) {
               e.preventDefault()
               activityFormShipper()
           })
        }

        function activityFormShipper() {
             $.ajax({
               url: 'http://localhost:3000/activities/new',
               method: 'GET',
               datatype: 'html' 
             }).success(function (response) {
               $('#activty-form-placeholder').html(response)
             })


        }

        // function activity() {
        //   var values = $(this).serialize();
        //   console.log(this)
        //   var  posting = $.post('/activities', values);
        //   posting.done(function(data) {
        //       var activity = data;
        //       $('#activtiyName').text(activity["name"]);
        //       $('#activityDuration').text(activity["duration"]);
        //       $('#activityDescription').text(activity["description"]); 
        //   });
        // }
                  
        // $('#myForm').on('submit', function(e) {
        //    e.preventDefault()
        //    console.log("hellow world")
        //    var queryString = $('#myForm').formSerialize();
        //    const postResp = $.post('/activities', queryString);
        //    postResp.done((respData) => {
            
        //    $('#activity_div').append(respData)
        //   })
        // })