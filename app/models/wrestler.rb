class Wrestler < ApplicationRecord
    has_and_belongs_to_many :teams
    has_and_belongs_to_many :matches
    has_many :records

    def self.yokozuna
        Wrestler.all.filter{|wrestler| wrestler.current_rank == "Y"}
    end

    def self.ozeki
        Wrestler.all.filter{|wrestler| wrestler.current_rank == "O"}
    end

    def self.sekiwake
        Wrestler.all.filter{|wrestler| wrestler.current_rank == "S"}
    end

    def self.komusubi
        Wrestler.all.filter{|wrestler| wrestler.current_rank == "K"}
    end

    def self.maegashira1
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M1"}
    end
    
    def self.maegashira2
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M2"}
    end

    def self.maegashira3
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M3"}
    end

    def self.maegashira4
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M4"}
    end

    def self.maegashira5
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M5"}
    end

    def self.maegashira6
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M6"}
    end

    def self.maegashira7
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M7"}
    end

    def self.maegashira8
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M8"}
    end

    def self.maegashira9
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M9"}
    end

    def self.maegashira10
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M10"}
    end

    def self.maegashira11
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M11"}
    end

    def self.maegashira12
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M12"}
    end

    def self.maegashira13
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M13"}
    end

    def self.maegashira14
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M14"}
    end

    def self.maegashira15
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M15"}
    end

    def self.maegashira16
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M16"}
    end

    def self.maegashira17
        Wrestler.all.filter{|wrestler| wrestler.current_rank === "M17"}
    end

end
