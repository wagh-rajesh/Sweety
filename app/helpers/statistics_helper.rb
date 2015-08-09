module StatisticsHelper
  
  def get_user_entries_per_day(user)
    todays_user_count = Statistic.created_today(user).size
  end
  
  def get_daily_report
    daily_report_params = params[:statistic]
    @date_params = daily_report_params["date(1i)"] + "-0" + daily_report_params["date(2i)"] +
                  "-0" + daily_report_params["date(3i)"]
    @daily_data = Statistic.get_daily_report(session[:username], @date_params)
  end
  
  def get_monthly_report
    @monthly_data = Statistic.get_monthly_report(session[:username])
  end

  def get_month_to_date_report
    report_params = params[:statistic]
    @start_date = report_params["start_date(1i)"] + "-0" + report_params["start_date(2i)"] +
                  "-0" + report_params["start_date(3i)"]
    @end_date = report_params["end_date(1i)"] + "-0" + report_params["end_date(2i)"] +
                  "-0" + report_params["end_date(3i)"]              
    @mtd_data = Statistic.get_month_to_date_report_data(session[:username], @start_date, @end_date)
  end
  
end
