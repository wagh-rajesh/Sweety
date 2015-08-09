class StatisticsController < ApplicationController
  
  include StatisticsHelper
  
  def index
  end

  def create
    if params.include?('statistic') && !session[:username].nil?
      @current_user = session[:username]
      count = get_user_entries_per_day(@current_user)
      unless count > 3
        @stat = Statistic.new(
                      :name => @current_user,
                      :level => params[:statistic][:level],
                      :created_at => Time.now.strftime("%Y-%m-%d")
                      )
        @stat.save
        all_users = Statistic.where(:name => @current_user) #created_today(Time.now.strftime("%Y-%m-%d")).size      
        all_users.size
        flash[:notice] = "Created Successfully ..."
      else
        puts "Reached Maximum limit per day ..."
        flash[:error] = "Reached Maximum limit per day ..."
      end
    end
    redirect_to :action => 'index'
  end

  def view_report
    @report_params = params
  end

end
