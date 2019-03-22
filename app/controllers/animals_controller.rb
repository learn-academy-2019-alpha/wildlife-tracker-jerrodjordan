class AnimalsController < ApplicationController
    
    def index
        @animal = Animal.all
    end
    
    def new
        @animal = Animal.new
    end
    
    def show
        @animal = Animal.find(params[:id])
        
    end
    
    def create
        
        @animal = Animal.new(animal_params)
        
        if @animal.save
            redirect_to animals_path
        else 
            render action: :new
        end
    end
    
    def edit
        @animal = Animal.find(params[:id])

    end
    
    def update
        
         @animal = Animal.find(params[:id])
            
        if @animal.update_attributes(animal_params)
            redirect_to animals_path
            
        else 
            render :edit
        end
    
    end
    
    def destroy
        
         @animal = Animal.destroy(params[:id])
         
         if @animal.destroy
             redirect_to animals_path
         
        else
            render destroy
        end
        
    end
    
end


private 

    def animal_params
            params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
