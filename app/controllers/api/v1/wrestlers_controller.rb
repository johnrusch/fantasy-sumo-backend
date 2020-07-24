class Api::V1::WrestlersController < ApplicationController
    
    def index
        render json: {
            yokozuna: Wrestler.yokozuna,
            ozeki: Wrestler.ozeki,
            sekiwake: Wrestler.sekiwake,
            komusubi: Wrestler.komusubi,
            maegashira: Wrestler.maegashira
        }
        
    end
    
    
end
