
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

doctor1 = Doctor.create(name: "Thompson")
doctor2 = Doctor.create(name: "Green")
doctor3 = Doctor.create(name: "Smith")
doctor4 = Doctor.create(name: "Jones")

# 
# 10.times do
patient1=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name)
patient2=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name)
patient3=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name)
patient4=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name)
patient5=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name)

appointment1 = Appointment.create(date: "01/07/2019", time: "11:00 - 12:00", patient_id: patient1.id, doctor_id: doctor1.id)
appointment2 = Appointment.create(date: "02/07/2019", time: "10:00 - 11:00", patient_id: patient2.id, doctor_id: doctor2.id)
appointment3 = Appointment.create(date: "03/07/2019", time: "12:00 - 13:00", patient_id: patient3.id, doctor_id: doctor3.id)
appointment4 = Appointment.create(date: "04/07/2019", time: "17:00 - 18:00", patient_id: patient4.id, doctor_id: doctor4.id)
