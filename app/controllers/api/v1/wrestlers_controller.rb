class Api::V1::WrestlersController < ApplicationController
    
    def index
        wrestlers = Wrestler.all
        render json: WrestlerSerializer.new(wrestlers)
    end
    
end
