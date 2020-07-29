class Api::V1::WrestlersController < ApplicationController
    
    def index
        wrestlers = Wrestler.all
        render json: wrestlers
    end
    
    # def banzuke
    #     render json: {
    #         yokozuna: Wrestler.yokozuna,
    #         ozeki: Wrestler.ozeki,
    #         sekiwake: Wrestler.sekiwake,
    #         komusubi: Wrestler.komusubi,
    #         maegashira1: Wrestler.maegashira1,
    #         maegashira2: Wrestler.maegashira2,
    #         maegashira3: Wrestler.maegashira3,
    #         maegashira4: Wrestler.maegashira4,
    #         maegashira5: Wrestler.maegashira5,
    #         maegashira6: Wrestler.maegashira6,
    #         maegashira7: Wrestler.maegashira7,
    #         maegashira8: Wrestler.maegashira8,
    #         maegashira9: Wrestler.maegashira9,
    #         maegashira10: Wrestler.maegashira10,
    #         maegashira11: Wrestler.maegashira11,
    #         maegashira12: Wrestler.maegashira12,
    #         maegashira13: Wrestler.maegashira13,
    #         maegashira14: Wrestler.maegashira14,
    #         maegashira15: Wrestler.maegashira15,
    #         maegashira16: Wrestler.maegashira16,
    #         maegashira17: Wrestler.maegashira17,
    #     }
    # end
    
end
