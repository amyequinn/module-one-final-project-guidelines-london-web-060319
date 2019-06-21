
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all


speciality1 = Speciality.create(name: "Dermatology")
speciality2 = Speciality.create(name: "Oncology")
speciality3 = Speciality.create(name: "Gastroenterology")

doctor1 = Doctor.create(name: "Thompson", speciality_id: speciality1.id)
doctor2 = Doctor.create(name: "Green", speciality_id: speciality2.id)
doctor3 = Doctor.create(name: "Smith", speciality_id: speciality3.id)
doctor4 = Doctor.create(name: "Jones", speciality_id: speciality1.id)
doctor5 = Doctor.create(name: "James", speciality_id: speciality2.id)
doctor6 = Doctor.create(name: "Reilly", speciality_id: speciality3.id)


patient1=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient2=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient3=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient4=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient5=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient6=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient7=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient8=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient9=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
patient10=Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)


appointment1 = Appointment.create(date: "25/06/2019", time: "11:00 - 12:00", patient_id: patient1.id, doctor_id: doctor1.id)
appointment2 = Appointment.create(date: "26/06/2019", time: "10:00 - 11:00", patient_id: patient2.id, doctor_id: doctor2.id)
appointment3 = Appointment.create(date: "27/06/2019", time: "12:00 - 13:00", patient_id: patient3.id, doctor_id: doctor3.id)
appointment4 = Appointment.create(date: "28/06/2019", time: "17:00 - 18:00", patient_id: patient4.id, doctor_id: doctor4.id)
appointment5 = Appointment.create(date: "01/07/2019", time: "11:00 - 12:00", patient_id: patient5.id, doctor_id: doctor5.id)
appointment6 = Appointment.create(date: "02/07/2019", time: "10:00 - 11:00", patient_id: patient6.id, doctor_id: doctor6.id)
appointment7 = Appointment.create(date: "03/07/2019", time: "12:00 - 13:00", patient_id: patient7.id, doctor_id: doctor1.id)
appointment8 = Appointment.create(date: "04/07/2019", time: "17:00 - 18:00", patient_id: patient8.id, doctor_id: doctor3.id)
appointment9 = Appointment.create(date: "01/07/2019", time: "12:00 - 13:00", patient_id: patient9.id, doctor_id: doctor3.id)
appointment10 = Appointment.create(date: "02/07/2019", time: "17:00 - 18:00", patient_id: patient10.id, doctor_id: doctor4.id)
appointment11 = Appointment.create(date: "25/06/2019", time: "11:00 - 12:00", patient_id: patient1.id, doctor_id: doctor2.id)
