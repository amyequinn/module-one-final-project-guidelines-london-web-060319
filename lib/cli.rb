  $prompt = TTY::Prompt.new

class CommandLineInterface

  def font
    font = TTY::Font.new(:doom, letter_spacing: 1)
    pastel = Pastel.new
    puts pastel.red(font.write("The Dr App!"))
  end

  def greet
    puts 'Welcome to the Dr Appointment Booking App!'
    puts ""
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
        create_appointment
      when "View_Appointment"
        view_my_appointments
      when "Edit_Appointment"
        select_appointment_to_edit
      when "Delete_Appointment"
        delete_appointment
      when "Quit"
      else menu
      end
    end

    def all_doctors
       @all_doctor_names = Doctor.all.map{|doctor|doctor.name}

    end

    def find_doctor_by_name
      find_doctor_by_name = Doctor.all.select{|doctor|doctor.name == @doctor_selected}

    end

    def find_doctor
      @find_doctor = find_doctor_by_name.find{|doctor|doctor.id}
    end


    def select_doctor

    choices = @all_doctor_names
    puts ""
    @doctor_selected = $prompt.select("Which Doctor would you like to book an appointment with?", choices)
    puts ""

    end

    def select_date

      puts "You can book your appointment up to 7 days in advance."
      choices = @every_day_next_week
      puts ""
      @date_selected = $prompt.select("Please select which date you would like to book your appointment for:", choices)
      puts ""

    end

    def select_time
      choices = @time_slots
      puts ""
      times_selected = $prompt.select("What time would you like to book your appointment?", choices)
      puts ""

      if times_selected == "Morning"
        time_slots
        morning_times

      elsif times_selected == "Afternoon"
        time_slots
        afternoon_times
      end

    end

    def time
      morning = "Morning"
      afternoon = "Afternoon"
      @time_slots =[morning, afternoon]
    end

    def morning_times
      choices = @am_time_slots
      puts ""
      @time_selected = $prompt.select("Please select time-slots:", choices)
      puts ""
      # create_appointment
    end

    def afternoon_times
      choices = @pm_time_slots
      puts ""
      @time_selected = $prompt.select("Please select time-slot:", choices)
      puts ""
      # create_appointment
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
      # # @dates_over_next_2_weeks =
      todays_date = Date.today
      todays_date_1 = Date.today+1
      todays_date_2 = Date.today+2
      todays_date_3 = Date.today+3
      todays_date_4 = Date.today+4
      todays_date_5 = Date.today+5
      todays_date_6 = Date.today+6
      #
      # 6.times do

      # date = Date.today
      #
      # date.each {|date|while date <= Date.today+6
      #   date=Date.today+=1}
      #
      # date = Date.today
      # @every_day_next_week = date.each {|date|while date <= Date.today+6
      #   date=Date.today+=1}
      @every_day_next_week = [todays_date, todays_date_1, todays_date_2, todays_date_3, todays_date_4, todays_date_5, todays_date_6]


    end

    def my_appointments
      # patient_id = @new_patient.id
        my_appointments = @new_patient.appointments

      # puts patient_appointment.map{|appointment|appointment.date}
      # puts patient_appointment.map{|appointment|appointment.time}
    end

    def find_my_appointments_by_id

      find_my_appointments_by_id = my_appointments.map{|appointments|appointments.id}

    end

    def view_my_appointments
      my_appointments
      view_appointments

      menu
    end

    def view_appointments

      if my_appointments.empty?
      puts ""
      puts "You have not yet booked any appointments"
      menu
      else
      puts "Your booked appointments:"
      puts ""
    end
      appointments = my_appointments.map do |appointments|
        puts "Appointment ID: #{appointments.id}"
        puts  "Date: #{appointments.date}"
        puts "Time: #{appointments.time}"
        puts "Doctor: #{appointments.doctor.name}"
        puts ""

      end
    end




      # def edit_appointments
      #   my_appointments
      #   view_appointments
      #
      #   choices = %w(Edit_Appointment Main_Menu)
      #   puts ""
      #   next_step = $prompt.select("Do you wish to edit appointment(s) or return to Main Menu?", choices)
      #   puts ""
      #
      #     if next_step == "Edit_Appointment"
      #     select_appointment_to_edit
      #
      #     else
      #     menu
      #     end
      # end

      # appointment_time = my_appointments.map{|appointments|appointments.time}
      # puts appointment_time[0]



      # appointment_dr = my_appointments.map{|appointments|appointments.doctor_id}
      # doctor_name = Doctor.all.select{|doctor|doctor.name if doctor.id == appointment_dr}
      # binding.pry
      # puts doctor_name[0]
      # appointment_dr = my_appointments.map{|appointments|appointments.doctor_id}
      # puts appointment_dr[0]


    # def find_appointment_by_doctor
    #   appointment_dr = my_appointments.map{|appointments|appointments.doctor_id}
    #
    # end

      # def find_doctor_name_by_id
      #   doctor_name = Doctor.all.select{|doctor|doctor.id == appointment_dr}
      # end

    def create_appointment

      all_doctors
      select_doctor
      find_doctor_by_name
      find_doctor
      this_week
      select_date
      time
      select_time

      new_appointment = Appointment.create(date: @date_selected, time: @time_selected, patient_id: @new_patient.id, doctor_id: @find_doctor.id)

      puts "Your appointment is booked as follows:"
      puts ""
      puts "Date: #{@date_selected}"
      puts "Time: #{@time_selected}"
      puts  "Doctor: #{@doctor_selected}"

      menu
    end

    def select_appointment_to_edit
      view_appointments

      choices = find_my_appointments_by_id
      puts ""
      @to_edit = $prompt.select("What is the Appointment ID of the appointment you would like to edit?", choices)
      puts ""
      appointment_by_id
      what_to_edit

    end

    def appointment_by_id
     appointment_by_id = my_appointments.find{|appointment|appointment.id == @to_edit}
    end

    def what_to_edit
      choices = %w(Date Time Doctor)
      puts ""
      @edit = $prompt.select("What would you like to edit?", choices)
      puts ""
      edit_appointment
    end

    def edit_appointment

      if @edit == "Date"
      change_date

      elsif @edit == "Time"
      change_time

      elsif @edit == "Doctor"
      change_doctor
      end

    end

    def change_date
      this_week
      puts "You can book your appointment up to 7 days in advance."
      choices = @every_day_next_week
      puts ""
      @new_date_selected = $prompt.select("Please select which date you would like to book your appointment for:", choices)
      puts ""
      update_date
    end


    def update_date
      appointment_by_id.update(date: @new_date_selected)
      puts "You have now changed your appointment ID: #{@to_edit} to the following date: #{@new_date_selected}"
      puts ""
      menu
    end

    def change_time
      time_slots
      time
      select_time
      update_time
      menu
    end

    def update_time
      appointment_by_id.update(time: @time_selected)
      puts "You have now changed your appointment ID: #{@to_edit} to the following time: #{@time_selected}"
      puts ""
      menu
    end

    def change_doctor
      all_doctors
      select_doctor
      find_doctor_by_name
      find_doctor
      update_doctor
    end

    def update_doctor
        appointment_by_id.update(doctor_id: @find_doctor.id)
        puts "You have now changed your appointment ID: #{@to_edit} to the following Doctor: #{@doctor_selected}"
        menu
    end
end
