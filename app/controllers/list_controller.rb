class ListController < ApplicationController 

    get '/list' do 
      authenticate
      @user = current_user
      @list = current_user.list.id 
      erb :'list/index'
    end 
 
    get '/list/new' do 
        authenticate
        @user = current_user
        erb :'/list/new'
      end 

      get '/list/:id' do
        authenticate
        @list = current_user.list.id
        # authorize(@fridge)
        erb :'list/index'
      end


      post '/list' do
      
        authenticate
        if current_user.list == nil 
            List.create(user: current_user)
        elsif
            @list = current_user.list
            @list.items << Item.create(name: params[:name])
            @list.items.all
            redirect '/list/index'
        else
            puts "Oops! Something went wrong!"
            redirect '/list/new'
        erb :'/list/index'
      end 
    end 

end 