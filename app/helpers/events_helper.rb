module EventsHelper

    def activity_form_option(form_builder)
        if @activity
           content_tag(:p, "Activity: #{@activity.name}")
        else
           render partial: "activityform", locals: {f: form_builder}
        end
      end


end
