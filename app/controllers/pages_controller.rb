class PagesController < ApplicationController
  def standart
    if params[:id].to_i.to_s == params[:id]
      @page = Page.find(params[:id])
    else 
      @page = Page.find_by_url('/' + params[:id].to_s)
    end
    if (@page ==  nil)
      @page = Page.find_by_url('/404')
    end  
  end

end
