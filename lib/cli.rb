  $prompt = TTY::Prompt.new

class CommandLineInterface

  def font
    font = TTY::Font.new(:doom, letter_spacing: 1)
    pastel = Pastel.new
    puts pastel.blue(font.write("Book a GP!"))
  end

  def greet
    puts 'Welcome to the Dr Appointment Booking App!'
    puts ""
    puts "Patient Login:"
    log_in
    puts ""
  end

  def log_in()
      first_name= $prompt.ask('What is your first name?', required: true)
      last_name= $prompt.ask('What is your last name?', required: true)
      if Patient.exists?(first_name: first_name, last_name: last_name)
        @new_patient=Patient.find_by(first_name: first_name, last_name: last_name)
      else
        @new_patient=Patient.create(first_name: first_name, last_name: last_name)
      end
      puts ""
      puts "Welcome #{first_name}"
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
        search_appointments
      when "Edit_Appointment"
        edit_appointments
      when "Delete_Appointment"
        delete_appointment
      when "Quit"

      else menu
    end
  end

    # def find_doctor_by_name
    #   Doctor.all.select{|doctor|doctor.name == $doctor_selected}
    # end
    #
    # def find_doctor
    #     Doctor.find_doctor_by_name.find{|doctor|doctor.id}
    # end

    def select_doctor
    choices = Doctor.all_doctors
    puts ""
    $doctor_selected = $prompt.select("Which Doctor would you like to book an appointment with?", choices)
    puts ""

    end

    def select_date

      puts "You can book your appointment up to 7 days in advance."
      choices = $every_day_next_week
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
        Appointment.time_slots
        morning_times

      elsif times_selected == "Afternoon"
        Appointment.time_slots
        afternoon_times
      end

    end

    def time
      morning = "Morning"
      afternoon = "Afternoon"
      @time_slots =[morning, afternoon]
    end

    def morning_times
      choices = $am_time_slots
      puts ""
      @time_selected = $prompt.select("Please select time-slots:", choices)
      puts ""
    end

    def afternoon_times
      choices = $pm_time_slots
      puts ""
      @time_selected = $prompt.select("Please select time-slot:", choices)
      puts ""
    end

    # def time_slots
    #
    #   nine_am = "09.00 - 10.00"
    #   ten_am = "10.00 - 11.00"
    #   eleven_am = "11.00 - 12.00"
    #   twelve_pm = "12.00 - 13.00"
    #   one_pm = "13.00 - 14.00"
    #   two_pm  = "14.00 - 15.00"
    #   three_pm  = "15.00 - 16.00"
    #   four_pm  = "16.00 - 17.00"
    #   five_pm = "17.00 - 18.00"
    #
    #     @am_time_slots = [nine_am, ten_am, eleven_am]
    #     @pm_time_slots = [twelve_pm, one_pm, two_pm, three_pm, four_pm, five_pm]
    # end

    # def this_week
    #
    #   todays_date = Date.today
    #   todays_date_1 = Date.today+1
    #   todays_date_2 = Date.today+2
    #   todays_date_3 = Date.today+3
    #   todays_date_4 = Date.today+4
    #   todays_date_5 = Date.today+5
    #   todays_date_6 = Date.today+6
    #
    #   $every_day_next_week = [todays_date, todays_date_1, todays_date_2, todays_date_3, todays_date_4, todays_date_5, todays_date_6]
    #
    # end

    # def find_my_appointments_by_id
    # #   binding.pry
    # #   @new_patient.appointments.map{|appointments|appointments.id}
    #   @new_patient.my_appointments
    #
    # end

    def view_my_appointments
      @new_patient.appointments
      view_appointments
      menu
    end

    def edit_appointments
      @new_patient.appointments
      view_appointments
      select_appointment_to_edit
      what_to_edit
      edit_appointment
    end

    def view_appointments

      if @new_patient.appointments.empty?
      puts ""
      puts "You have not yet booked any appointments"
      menu
      else
      puts "Your booked appointments:"
      puts ""
    end

      puts @new_patient.all_my_appointments
      search_appointments
      end

      def search_appointments

        choices = %w(All_my_appointments My_next_appointment My_last_appointment Dates_of_my_appointments My_Doctors Menu)
        puts ""
        search = $prompt.select("What would you like to view?", choices)
        puts ""

        case search

        when "All_my_appointments"
          view_appointments
        when "My_next_appointment"
          next_appointment
        when "My_last_appointment"
          last_appointment
        when "Dates_of_my_appointments"
          dates_of_appointments
        when "My_Doctors"
          doctors
        when "Menu"
          menu
        end

      end

    def create_appointment

      Doctor.all_doctors
      select_doctor
      Doctor.find_doctor_by_name
      Doctor.find_doctor
      Appointment.this_week
      select_date
      time
      select_time

      new_appointment = Appointment.create(date: @date_selected, time: @time_selected, patient_id: @new_patient.id, doctor_id: Doctor.find_doctor.id)

      puts "Your appointment is booked as follows:"
      puts ""
      puts "Date: #{@date_selected}"
      puts "Time: #{@time_selected}"
      puts  "Doctor: #{$doctor_selected}"

      @new_patient=Patient.find(@new_patient.id)

      menu
    end

    def select_appointment_to_edit

      choices = @new_patient.my_appointments
      puts ""
      @to_edit = $prompt.select("What is the Appointment ID of the appointment you would like to select?", choices)
      puts ""
      appointment_by_id

    end
    #
    # def select_appt_by_date
    #
    #   puts "You can search for appointments booked by date."
    #
    #   choices = @new_patient.select_appt_by_date(date)
    #
    #   date = $prompt.select("Please select the date you would like to check:", choices)
    #
    # end

    def next_appointment

     puts "Please see your next appointment:"

      @new_patient.my_next_appointment

      search_appointments

    end

    def last_appointment

      puts ""
      puts "Please see your last appointment:"
      puts ""
      @new_patient.my_last_appointment
      search_appointments



    end

    def dates_of_appointments

      puts "Please see the dates you have appointments booked on:"
      puts ""
      @new_patient.my_dates_booked
      search_appointments

    end

    def doctors

      puts ""
      puts "Please see all the doctors you have appointments booked with:"

      @new_patient.my_doctors
      search_appointments

    end


    # def my_next_appointment
    #
    #   first_appt = @new_patient.appointments.first
    #
    #   puts "Please see your next appointment details: "
    #   puts ""
    #   puts "Appointment ID: #{first_appt.id}"
    #   puts  "Date: #{first_appt.date}"
    #   puts "Time: #{first_appt.time}"
    #   puts "Doctor: #{first_appt.doctor.name}"
    #   puts ""
    # end


    def appointment_by_id
     @new_patient.appointments.find{|appointment|appointment.id == @to_edit}
    end

    def what_to_edit
      choices = %w(Date Time Doctor)
      puts ""
      @edit = $prompt.select("What would you like to edit / delete?", choices)
      puts ""

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
      Appointment.this_week
      puts "You can book your appointment up to 7 days in advance."
      choices = $every_day_next_week
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
      Appointment.time_slots
      time
      select_time
      update_time

    end

    def update_time
      appointment_by_id.update(time: @time_selected)
      puts "You have now changed your appointment ID: #{@to_edit} to the following time: #{@time_selected}"
      puts ""
      menu
    end

    def change_doctor
      Doctor.all_doctors
      select_doctor
      Doctor.find_doctor_by_name
      Doctor.find_doctor
      update_doctor
    end

    def update_doctor
        appointment_by_id.update(doctor_id: Doctor.find_doctor.id)
        puts "You have now changed your appointment ID: #{@to_edit} to the following Doctor: #{$doctor_selected}"
        menu
    end

    def delete_appointment
      @new_patient.appointments
      view_appointments
      select_appointment_to_edit

      choices = %w(Yes No)
      puts ""
      answer = $prompt.select("Are you sure you wish to cancel your appointment?", choices)
      puts ""

      if answer == "Yes"

        appointment_by_id.destroy
        @new_patient=Patient.find(@new_patient.id)
        puts ""
        puts "You have cancelled your appointment."
        menu
      else menu
      end
    end
end
