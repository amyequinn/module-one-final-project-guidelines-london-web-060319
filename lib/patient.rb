class Patient<ActiveRecord::Base
  has_many :appointments
  has_many :doctors, through: :appointments

# patient with most appointments

  def my_appointments
   # My appointment ID's
    # variable = Appointment.all.select{|appointments|appointments.patient_id == self.id}
    # variable.map{|appointments|appointments.id}
    # self.appointments
    self.appointments.ids
  end

  def all_my_appointments

      self .appointments.map do |appointments|
      puts "Appointment ID: #{appointments.id}"
      puts  "Date: #{appointments.date}"
      puts "Time: #{appointments.time}"
      puts "Doctor: #{appointments.doctor.name}"
      puts "Speciality: #{appointments.doctor.speciality.name}"
      puts ""
    end
    end

    def my_next_appointment

      first_appt = self.appointments.first

      puts "Appointment ID: #{first_appt.id}"
      puts  "Date: #{first_appt.date}"
      puts "Time: #{first_appt.time}"
      puts "Doctor: #{first_appt.doctor.name}"
      puts ""

    end

    def my_last_appointment
      last_appt = self.appointments.last

      puts "Appointment ID: #{last_appt.id}"
      puts  "Date: #{last_appt.date}"
      puts "Time: #{last_appt.time}"
      puts "Doctor: #{last_appt.doctor.name}"
      puts ""
  end

    def my_dates_booked
      self .appointments.map do |appointments|
      puts  "Date: #{appointments.date}  Time: #{appointments.time}"
    end
    end

    def my_doctors
        self .appointments.map do |appointments|
        puts ""
        puts "Doctor: #{appointments.doctor.name}"
        puts "Speciality: #{appointments.doctor.speciality.name}"

      end
    end

end
