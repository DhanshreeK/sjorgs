class DashboardsController < ApplicationController
  def index
  
  	@messages = Customer.message_history
  end

  def datatable
  end
end
