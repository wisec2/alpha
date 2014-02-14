class UsersController < ApplicationController

def new
  @user = User.new
  #@user.birthdate = params[:user]['birthdate(1i)'] + params[:user]['birthdate(2i)'] + params[:user]['birthdate(3i)']
end

def create

  @user = User.new(params[:user].permit(:username, :password, :password_confirmation, :gender, :email))

  puts @user.password
  # Assemble a formatted birthdate string
  @clean_dob = Date.parse([params[:user]['birthdate(1i)'], params[:user]['birthdate(2i)'], params[:user]['birthdate(3i)']].join('-'))

  # Assign birthdate to user record 
  @user.birthdate = @clean_dob

  if @user.save
    redirect_to users_path
  else
    render 'register'
  end
end


def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
end

# Login function
# If a user is already logged in, redirect them to the home page.
def login
  if session[:userid] != nil
    redirect_to root_path
  end
end

# Authenticate the user trying to login.
def authUser
  @user = User.find_by(username: params['username']).try(:authenticate, params['password'])
  if @user != false
    session[:userid] = @user.id
    redirect_to root_path
  else
    render 'login'
  end
end

# Logout
def logout
  session[:userid] = nil
  redirect_to root_path
end

def register
end

def destroy
  @user = User.find(params[:id])
  @user.destroy

  redirect_to root_path
end

private
  def user_params
  end

end
