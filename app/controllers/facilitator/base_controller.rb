class Facilitator::BaseController < ApplicationController

  layout 'application'

  before_action :authenticate_facilitator!

end
