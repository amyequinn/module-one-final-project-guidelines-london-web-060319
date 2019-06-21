class Appointment< ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  def self.time_slots

    nine_am = "09.00 - 10.00"
    ten_am = "10.00 - 11.00"
    eleven_am = "11.00 - 12.00"
    twelve_pm = "12.00 - 13.00"
    one_pm = "13.00 - 14.00"
    two_pm  = "14.00 - 15.00"
    three_pm  = "15.00 - 16.00"
    four_pm  = "16.00 - 17.00"
    five_pm = "17.00 - 18.00"

      $am_time_slots = [nine_am, ten_am, eleven_am]
      $pm_time_slots = [twelve_pm, one_pm, two_pm, three_pm, four_pm, five_pm]
  end

  def self.this_week

    todays_date = Date.today
    todays_date_1 = Date.today+1
    todays_date_2 = Date.today+2
    todays_date_3 = Date.today+3
    todays_date_4 = Date.today+4
    todays_date_5 = Date.today+5
    todays_date_6 = Date.today+6

    $every_day_next_week = [todays_date, todays_date_1, todays_date_2, todays_date_3, todays_date_4, todays_date_5, todays_date_6]

  end


end
