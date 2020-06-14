class ApplicationController < Sinatra::Base
    configure do
        set :views, -> {File.join(root, "../views")}
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
      end
    


    get '/' do 

        erb :index

    end 


    helpers do 
        def current_user
            @user ||= User.find_by(id: session[:user_id])
        end 

        def logged_in? 
            !!current_user
        end 
        
        def authenticate
            redirect 'login' if !logged_in? 
        end 

        def authorize(resource)
             authenticate
            redirect '/dashboard' if resource.user != current_user
        end
    end 
end 