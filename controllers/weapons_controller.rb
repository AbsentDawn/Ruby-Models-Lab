class WeaponsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end


  # The Index Page
  get '/' do 
  	@title = "Square Enix Weapons Gallery"
  	@weapons = Weapons.all
  	erb :'weapons/index'
  end 

  # The "New" Page
  get '/new' do

  	@weapon = Weapons.new
  	
  	erb :'weapons/new'
  end

  # Show Weapons page
  get '/:id' do 
  	id = params[:id].to_i

  	@weapon = Weapons.find(id)

  	erb :'weapons/show'
  end

  # Submit new creation, redirect to the home page
  post '/' do 

  	weapon = Weapons.new

  	weapon.name = params[:name] 
  	weapon.attack = params[:attack] 
  	weapon.speed = params[:speed] 
  	weapon.owner = params[:owner]  
  	weapon.game = params[:game] 

  	weapon.save

  	redirect "/"
  end

  # Update the weapon, redirect to the home page
  put '/:id' do 

  	id = params[:id].to_i

  	weapon = Weapons.find(id)

  	weapon.name = params[:name] 
  	weapon.attack = params[:attack] 
  	weapon.speed = params[:speed] 
  	weapon.owner = params[:owner]  
  	weapon.game = params[:game] 

  	weapon.save

  	redirect "/"
  end

  # Delete the weapon, redirect to the home page
  delete '/:id' do 

  	id = params[:id].to_i

  	Weapons.destroy(id)


  	redirect "/"
  end

  # Show the edit page
  get '/:id/edit' do 

  	id = params[:id].to_i

  	@weapon = Weapons.find(id)

  	erb :'weapons/edit'
  end
end