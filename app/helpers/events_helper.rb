module EventsHelper

   def display_index_header
     if @activity 
        content_tag(:h2, "Events with #{@activity.name}")
     elsif @location
        content_tag(:h2, "Events at #{@location.name}")
     else
        content_tag(:h1, "All Events")
     end
   end




    def activity_form_option(form_builder)
        if @activity
           content_tag(:p, "Activity: #{@activity.name}")
        else
           render partial: "activityform", locals: {f: form_builder}
        end
      end


end
