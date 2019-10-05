class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    if !logged_in?
      erb :"/sessions/login.html"
    else
      redirect "/massage_spas/#{@massage_spa.id}"
    end
  end

  # POST: /sessions
  post "/login" do
    @massage_spa = MassageSpa.find_by(email: params[:email])
    if @massage_spa && @massage_spa.authenticate(params[:password])
      session[:massage_spa_id] = @massage_spa.id
    
      redirect "/massage_spas/#{@massage_spa.id}}"
    else
      redirect '/login'
    end
  end

  get "/logout" do
    session.clear
    erb :"/sessions/logout.html"
  end

  

  
end





