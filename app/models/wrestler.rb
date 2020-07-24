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

    def self.maegashira
        wrestlers = Wrestler.all.filter{|wrestler| wrestler.current_rank.include? "M"}
        i = 1
        arr = []
        while i != 18
            rank = wrestlers.filter{|wrestler| wrestler.current_rank == "M#{i}"}
            rank.sort_by!{|wrestler| wrestler.division}
            arr.push(rank)
            i += 1
        end
        return arr
    end

    # def self.by_rank

    # end
end
