class HomeController < ApplicationController
def index
@homes = Home.find(:all)


end
end






