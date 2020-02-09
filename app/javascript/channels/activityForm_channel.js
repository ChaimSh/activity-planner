 
        $(document).ready(function() { 
            var options = {
             resetForm: true
            }
            $('#myForm').ajaxForm( options, function() {  
            }); 
        }); 

        $('#myForm').on('submit', function(e) {
           e.preventDefault()
           var queryString = $('#myForm').formSerialize();
           const postResp = $.post('/activities', queryString);
           postResp.done((respData) => {
            console.log(respData)
           $('#activity_div').append(respData)
          })
        })