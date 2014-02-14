class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.authenticate(params['username'], params['password'])
    

  end

  def destroy
  end

end
