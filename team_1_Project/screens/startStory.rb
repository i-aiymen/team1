require_relative '../sprite/startStoryChar.rb'
# require_relative '../sprite/.rb'

class StartStory
    @player_sprite
    @portal_sprite
    @story_maxTime
    @story_timer
    @isShowing
    @storyIndex
    
    @@backgroundImage = Image.load('image/background.png')
    @@storyImages = [
        Image.load("image/story-1.png"),
        Image.load("image/story-2.png"),
        Image.load("image/story-3.png"),
        Image.load("image/story-4.png")
    ]
    

    def initialize
        # @player_sprite = Sprite.new(100, 200, Image.new("image/#{@avatar}.png"))
        @portal_sprite = Sprite.new(500, 400, Image.load("image/startPortal.png"))
        @player_sprite = StartStoryChar.new(100, 500, Image.load("image/playerYoru0.png"))
        @isShowing = false
        @storyIndex = 0
    end

    def draw
        Window.draw(0, 0, @@backgroundImage)
        @portal_sprite.draw
        @player_sprite.draw
    end

    def update
        @player_sprite.move

        if Sprite.check(@player_sprite, @portal_sprite)
            @isShowing = true
        end

        if @isShowing
            Window.draw(0,0,@@storyImages[@storyIndex])
        end

        if Input.key_push?(K_RETURN) && @isShowing
            @storyIndex += 1
        end

        if @storyIndex >= @@storyImages.size
            @isShowing = false
            $flag = 9
        end
    end
end