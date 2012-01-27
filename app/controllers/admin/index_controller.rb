class Admin::IndexController < ApplicationController
  before_filter :authorize, :except=> 'login'
  def index

  end
  def authorize
    redirect_to :action=>'login' if !session[:auth]
  end
  #raise user.admin?

  def login
    if (params[:admin]) 
      session[:auth]=1
      if (params[:admin][:name]=='admin' and params[:admin][:pass]=='') 
        session[:admin]=1
        redirect_to :controller => 'admin/index', :action => 'index'
      else
        flash[:error] = 'Failed'
      end
    end
  end
end
