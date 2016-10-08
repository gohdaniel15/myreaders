class PagesController < ApplicationController

  respond_to :js, only: [:login]

  def home; end

  def login; end

end
