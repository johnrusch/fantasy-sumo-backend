class Api::V1::WrestlersController < ApplicationController

    def index
        wrestlers = Wrestler.all
        render json: wrestlers
    end
    
end
