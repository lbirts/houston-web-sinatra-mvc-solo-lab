class PuppiesController < ApplicationController
   
    get '/puppies' do
        @puppies = Puppy.all
        erb :index
      end

      get '/puppies/new' do
        erb :new
      end

      get '/puppies/:id' do
        @puppy = Puppy.find(params[:id])
        erb :show
      end

      post '/puppies/new' do
        redirect "/puppies/new"
      end

      post '/puppies' do
        pup = Puppy.create(params)
        redirect "/puppies/#{pup.id}"
      end

      get '/puppies/:id/edit' do
        @puppy = Puppy.find(params[:id])
        erb :edit
      end

      post '/puppies/:id/edit' do
        @puppy = Puppy.find(params[:id])
        redirect "/puppies/#{@puppy.id}/edit"
      end

      patch '/puppies/:id' do
        pup = Puppy.find(params[:id])
        pup.update(name: params[:name], breed: params[:breed])
        redirect "/puppies/#{pup.id}"
      end

      delete '/puppies/:id' do
        Puppy.delete(params[:id])
        redirect "/puppies"
      end
end