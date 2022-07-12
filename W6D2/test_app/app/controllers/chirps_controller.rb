class ChirpsController < ApplicationController
    def index
        # render html: helpers.tag.h1('hello there young ones')
        render plain: "hello there yung ones"
    end
end

