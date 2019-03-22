class SightingsController < ApplicationController
    
    def index
        @sighting = Sighting.all
    end
    
    def new 
        
        animal = Animal.find(params[:animal_id])
        @sighting = animal.sightings.new
        
    end
    
    def create

        @sighting = Sighting.new(sighting_params)
        
        if @sighting.save
            redirect_to animal_path(@sighting.animal)
        else 
            render action: :new
        end
    
    end
    
    def edit
        @sighting = Sighting.find(params[:id])

    end
    
    def update
        
        @sighting = Sighting.find(params[:id])
        
        if @sighting.update_attributes(sighting_params)
            redirect_to animal_path(@sighting.animal)
        else 
            render action: :edit
        end
    
    end
    
        def destroy
        
         @sighting = Sighting.destroy(params[:id])
         
         if @sighting.destroy
             redirect_to animal_path(@sighting.animal)
         
        else
            render action: :destroy
        end
        
    end
    
    
end

private 

    def sighting_params
            params.require(:sighting).permit(:animal_id, :date, :time, :latitude, :longitude, :region)
    end
