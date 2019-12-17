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

Student.create(name: 'has_schedule_student',
               email: '4@4.cn',
               password: '111111',
               password_confirmation: '111111')


Student.create(name: 'has_over_timed_schedule_student',
               email: '5@5.cn',
               password: '111111',
               password_confirmation: '111111')

10.times do |n|
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

teachers = Teacher.order(:created_at).take(10)
5.times do |n|
  weekday = Random.rand(1..7)
  place = Random.rand(4)
  start_time = Time.new(2000, 1, 1, Random.rand(7..21), 0, 0)
  end_time = start_time + 1.hour
  teachers.each { |teacher| teacher.locations.create(weekday: weekday, place: place, start_time: start_time.to_s(:db), end_time: end_time.to_s(:db))}
end

hss = Student.find_by(id:2)
hsss = hss.build_schedule
hsss.location = Location.find_by(id:1)
hsss.start_time = hsss.location.start_time
hsss.end_time = hsss.location.end_time
hsss.teacher = hsss.location.teacher
hsss.save

hotss = Student.find_by(id:3)
hotsss = hotss.build_schedule
hotsss.location = Location.find_by(id:15)
hotsss.start_time = hotsss.location.start_time
hotsss.end_time = hotsss.location.end_time
hotsss.teacher = hotsss.location.teacher
hotsss.save
hotsss = Schedule.find_by(id:2)
hotsss.update!(next_start_time: hotsss.next_start_time - 1.week)
