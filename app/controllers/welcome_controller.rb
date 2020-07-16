class WelcomeController < ApplicationController
    def hello_world
        render(plain: "hello world")
    end
    def root
        # beacuse of rails convention every one of these actions will
        #automatically renders a template
        #the template it renders is inside views/controller_name/method_name.html.erb
        #so in this caseroot action will render

    end
    def contact_us


    end
    def process_contact
        @full_name = params[:full_name]
        @email = params[:email]
        @message = params[:message]

        render :thank_you
    end
end
