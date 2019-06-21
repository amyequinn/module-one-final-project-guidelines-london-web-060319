class Doctor<ActiveRecord::Base
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :speciality

# All doctor names
  def self.all_doctors
      Doctor.all.map{|doctor|doctor.name}
  end

  # def self.find_doctor_by_name(name)
  #   Doctor.find_by(:name => name)
  # end

  def self.find_doctor_by_name
    Doctor.all.select{|doctor|doctor.name == $doctor_selected}
  end

  def self.find_doctor
      find_doctor_by_name.find{|doctor|doctor.id}
  end

  # def self.find_dr_speciality
  #   Doctor.all.select{|doctor|doctor.speciality_id == $speciality_selected}
  #
  # end
end
