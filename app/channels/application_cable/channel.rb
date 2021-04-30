module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def initialize
      @connected_list = []
    end

  end
end
