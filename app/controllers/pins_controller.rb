class PinsController < ApplicationController
  before_action :require_login, except: [:show, :show_by_name, :index]
  
  def index
    @pins = Pin.all
  end
  
  def show
    @pin = Pin.find(params[:id])
    @users = @pin.users
  end
  
  def show_by_name
  	@pin = Pin.find_by_slug(params[:slug])
    @users = @pin.users
  	render :show
  end

  def new
    @pin = Pin.new
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
 
  if @pin.update(pin_params)
    redirect_to pin_path(@pin)
  else
    @errors = @pin.errors
    render :edit
    # redirect_to edit_pin_path(@pin)
    end
  end

  def create
    @pin = Pin.create(pin_params)
 
  if @pin.valid?
    @pin.save
    redirect_to pin_path(@pin)
  else
    @errors = @pin.errors
    render :new
    end
  end

  def repin
    @pin = Pin.find(params[:id])
    @pin.pinnings.create(user: current_user)
    redirect_to user_path(current_user)
  end
    
  private
 
  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id)
  end

end