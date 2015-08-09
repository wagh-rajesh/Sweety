class Statistic < ActiveRecord::Base
  belongs_to :user
  
  def self.created_today(user)
    self.where("created_at = :created_at and name = :name",{created_at: Time.now.strftime("%Y-%m-%d"), name: user}) 
  end
  
  def self.get_daily_report(user, date)
    self.where("created_at = :created_at and name = :name",{created_at: date.to_s, name: user})               
  end

  def self.get_monthly_report(user)
     self.where("created_at >= :start_date and created_at <= :end_date and name = :name",
                  { start_date: Time.parse(Time.now.to_s).strftime("%Y-%m-01"),
                    end_date: Time.now.strftime("%Y-%m-%d"),
                    name: user})
  end
  
  def self.get_month_to_date_report_data(user, str_date, end_date)
     self.where("created_at >= :start_date and created_at <= :end_date and name = :name",
                  { start_date: str_date, end_date: end_date, name: user})
  end
end