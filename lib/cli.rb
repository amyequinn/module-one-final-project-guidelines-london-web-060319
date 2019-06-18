  $prompt = TTY::Prompt.new

class CommandLineInterface

  def greet
    puts 'Welcome to the Appointment Booking App!'
    log_in
  end

  def log_in
    puts "What is your first name?"
    @first_name = gets.chomp
    puts "What is your last name?"
    @last_name = gets.chomp
    new_patient
  end

  def new_patient
    if Patient.exists?(first_name: @first_name, last_name: @last_name)
      @new_patient = Patient.find_by(first_name: @first_name, last_name: @last_name)
    else
      @new_patient=Patient.create!(first_name: @first_name, last_name: @last_name)
    end
      puts ""
      puts "Welcome #{@first_name}"
      menu
    end

    def menu

      puts ""
      choices = %w(Create_Appointment View_Appointment Edit_Appointment Delete_Appointment Quit)
      puts ""
      answer = $prompt.select("Please select your next step:", choices)

      case answer

      when "Create_Appointment"
        all_doctors
      when "View_Appointment"
        my_appointments
      when "Edit_Appointment"
        edit_appointment
      when "Delete_Appointment"
        delete_appointment
      when "Quit"
      else menu

      end

    end

    def all_doctors
       @all_doctor_names = Doctor.all.map{|doctor|doctor.name}
       select_doctor
    end

    def find_doctor_by_name
      Doctor.all.select{|doctor|doctor.name == @doctor_selected}


    end

    def find_doctor_id
      @find_doctor_id = find_doctor_by_name.map{|doctor|doctor.id}
    end

    def select_doctor

    choices = @all_doctor_names
    puts ""
    @doctor_selected = $prompt.select("Which Doctor would you like to book an appointment with?", choices)
    puts ""
    find_doctor_by_name

    this_week


    end

    def select_date

      choices = @every_day_next_week
      puts ""
      @date_selected = $prompt.select("When would you like to book your appointment?", choices)
      puts ""
      time
    end

    def select_time
      choices = @time_slots
      puts ""
      time_selected = $prompt.select("What time would you like to book your appointment?", choices)
      puts ""

      if time_selected == "Morning"
        time_slots
        morning_times

      elsif time_selected == "Afternoon"
        time_slots
        afternoon_times


      end

    end

    def time
      morning = "Morning"
      afternoon = "Afternoon"
      @time_slots =[morning, afternoon]
      select_time

    end

    def morning_times
      choices = @am_time_slots
      puts ""
      @time_selected = $prompt.select("Please select time-slots:", choices)
      puts ""
      create_appointment
    end

    def afternoon_times
      choices = @pm_time_slots
      puts ""
      @time_selected = $prompt.select("Please select time-slot:", choices)
      puts ""
      create_appointment
    end

    def time_slots

      nine_am = "09.00 - 10.00"
      ten_am = "10.00 - 11.00"
      eleven_am = "11.00 - 12.00"
      twelve_pm = "12.00 - 13.00"
      one_pm = "13.00 - 14.00"
      two_pm  = "14.00 - 15.00"
      three_pm  = "15.00 - 16.00"
      four_pm  = "16.00 - 17.00"
      five_pm = "17.00 - 18.00"

        @am_time_slots = [nine_am, ten_am, eleven_am]
        @pm_time_slots = [twelve_pm, one_pm, two_pm, three_pm, four_pm, five_pm]
    end

    def this_week
      # @dates_over_next_2_weeks =
      todays_date = Date.today
      todays_date_1 = Date.today+1
      todays_date_2 = Date.today+2
      todays_date_3 = Date.today+3
      todays_date_4 = Date.today+4
      todays_date_5 = Date.today+5
      todays_date_6 = Date.today+6
      todays_date_7 = Date.today+7

      @every_day_next_week = [todays_date, todays_date_1, todays_date_2, todays_date_3, todays_date_4, todays_date_5, todays_date_6, todays_date_7]

      select_date
    end

    def my_appointments
      # patient_id = @new_patient.id
        @new_patient.appointments
      # puts patient_appointment.map{|appointment|appointment.date}
      # puts patient_appointment.map{|appointment|appointment.time}
    end
    #
    def create_appointment
      find_doctor_by_name
      find_doctor_id

      new_appointment = Appointment.create(date: @date_selected, time: @time_selected, patient_id: @new_patient.id, doctor_id: @find_doctor_id)

      menu
    end

    # def new_appointment_details
    #
    #   # puts @new_appointment.map{|appointment|appointment.date}
    #   # puts @new_appointment.map{|appointment|appointment.time}
    #   # puts @doctor_selected
    #
    # end


end
