# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Teacher.create(name: 'admin',
            email: '1@1.cn',
            password: '111111',
            password_confirmation: '111111',
            role: 'admin')

Teacher.create(name: 'teacher',
               email: '2@2.cn',
               password: '111111',
               password_confirmation: '111111')

Student.create(name: 'student',
               email: '3@3.cn',
               password: '111111',
               password_confirmation: '111111')


27.times do |n|
  name = Faker::Name.name
  email = "teacher-#{n+1}@ucas.ac.cn"
  password = "111111"
  Teacher.create(name: name,
              email: email,
              password: password,
              password_confirmation: password)
end

70.times do |n|
  name = Faker::Name.name
  email = "student-#{n+1}@ucas.ac.cn"
  password = "111111"
  Student.create(name: name,
              email: email,
              password: password,
              password_confirmation: password)
end

teachers = Teacher.order(:created_at).take(6)
5.times do |n|
  weekday = Random.rand(7)
  place = Random.rand(4)
  start_time = '2000-01-01 08:00:00'
  finish_time = '2000-01-01 14:00:00'
  teachers.each { |teacher| teacher.locations.create(weekday: weekday, place: place, start_time: start_time, finish_time: finish_time)}
end
