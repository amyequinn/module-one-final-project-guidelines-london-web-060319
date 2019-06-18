
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

doctor1 = Doctor.create(name: "Thompson")
doctor2 = Doctor.create(name: "Smith")
doctor3 = Doctor.create(name: "Jones")

patient1 = Patient.create(first_name: "Amy", last_name: "Quinn")
patient2 = Patient.create(first_name: "Tom", last_name: "Russell")

appointment1 = Appointment.create(date: "01/07/2019", time: "11:00:00", patient_id: patient1.id, doctor_id: doctor1.id)
appointment2 = Appointment.create(date: "02/07/2019", time: "10:00:00", patient_id: patient2.id, doctor_id: doctor2.id)
binding.pry
