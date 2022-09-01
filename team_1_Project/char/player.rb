class Player

    def initialize
        @name = ""
        @time = 0
  
        @state = {
            "hp" => 20,
            "mp" => 10,
        }
    end
     
    def name=(name)
        @name = name
    end

    def name
        @name
    end

    def state
        @state
    end

    def hp
        @state["hp"]
    end

    def hp=(hp)
        @state["hp"] = hp
    end

    def k_fire
        sum = 0
        return sum
    end

    def b_fire
        sum = 0
        return sum
    end

    def mp
        @state["mp"]
    end

    def mp=(mp)
        @state["mp"] = mp
    end

    def mp_heal
        if @time % 30 == 0
            @state["mp"] += 1
            @state["mp"] = [@state["mp"], 10].min
        end
        @time += 1
    end
end