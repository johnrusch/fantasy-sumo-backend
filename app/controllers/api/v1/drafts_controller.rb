class Api::V1::DraftsController < ApplicationController

    def create
        @draft = Draft.new(draft_params)
    end

end