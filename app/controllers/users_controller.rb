class UsersController < ApplicationController
    def user
        @user= User.all
    end
end