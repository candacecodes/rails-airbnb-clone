class HousesController < ApplicationController
    before_action :set_house, only:[:show, :edit, :update, :destroy]

    def index
        @houses = House.all

        if params[:bedrooms]
            @house = House.where('bedrooms LIKE ?', "%#{params[:bedrooms]}%")
        elsif params[:bathrooms]
            @house = House.where('bathrooms LIKE ?', "%#{params[:bathrooms]}%")
        elsif params[:parking]
            @house = House.where('parking LIKE ?', "%#{params[:parking]}%")
        elsif params[:guest_limit]
            @house = House.where('guest_limit LIKE ?', "%#{params[:guest_limit]}%")
        elsif params[:pet_friendly]
            @house = House.where('pet_friendly LIKE ?', "%#{params[:pet_friendly]}%")
        elsif params[:house_type]
            @house = House.where('house_type LIKE ?', "%#{params[:house_type]}%")
        elsif params[:cost_per_day]
            @house = House.where('cost_per_day WHERE cost_per_day < ?', "%#{params[:cost_per_day]}%")
        else
            @house = House.all
        end
    end

    def show
        @house = House.find(params[:id])
        session[:house] = @house.id
    end

    def new
        @house = House.new(params[:id])
    end
    
    def create
        @house = House.new(house_params)
        if @house.save
            redirect_to @house
        else
            flash[:message] = @house.errors.full_messages
            render :new
        end
    end

    def update
        if @house.update(house_params)
        redirect_to host_path(@house.host_id)
        else 
        flash[:message] = @house.errors.full_messages 
		render :new 
        end 
    end

    def destroy
        id = @house.host_id
        @house.destroy
        redirect_to host_path(id)    
    end

    private

    def house_params
        params.require(:house).permit(:address, :bedrooms, :bathrooms, :parking, :guest_limit, :pet_friendly, :house_type, :host_id, :cost_per_day, :img_url, :search)
    end

    def set_house
        @house = House.find(params[:id])
    end
end
