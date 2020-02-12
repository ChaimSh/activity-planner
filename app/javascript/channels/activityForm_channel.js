 
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
              $('#activity-form-button').hide()
               $('#activty-form-placeholder').html(response)
             })
        }
