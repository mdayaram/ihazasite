class SomethingController < ApplicationController

  def index
    respond_to do |format|
      format.html
    end
  end

  def template
    template = params[:template]
    render template: "something/#{template}"
  end

end
