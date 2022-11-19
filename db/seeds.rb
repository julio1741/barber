# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

worker1 = Worker.find_or_create_by(name: 'Lucio')
worker2 = Worker.find_or_create_by(name: 'Jose')

worker3 = Worker.find_or_create_by(name: 'Ricargo')
worker4 = Worker.find_or_create_by(name: 'Antonia')

work_day1 = WorkDay.find_or_create_by(name: 'sunday', day_number: 0)
work_day2 = WorkDay.find_or_create_by(name: 'monday', day_number: 1)
work_day3 = WorkDay.find_or_create_by(name: 'tuesday', day_number: 2)
work_day4 = WorkDay.find_or_create_by(name: 'wednesday', day_number: 3)
work_day5 = WorkDay.find_or_create_by(name: 'thursday', day_number: 4)
work_day6 = WorkDay.find_or_create_by(name: 'friday', day_number: 5)
work_day7 = WorkDay.find_or_create_by(name: 'saturday', day_number: 6)

block_time1 = BlockTime.find_or_create_by(start: '8:00', end: '9:00')
block_time2 = BlockTime.find_or_create_by(start: '9:00', end: '10:00')
block_time3 = BlockTime.find_or_create_by(start: '10:00', end: '11:00')
block_time4 = BlockTime.find_or_create_by(start: '11:00', end: '12:00')
block_time5 = BlockTime.find_or_create_by(start: '12:00', end: '13:00')
block_time6 = BlockTime.find_or_create_by(start: '14:00', end: '15:00')
block_time7 = BlockTime.find_or_create_by(start: '15:00', end: '16:00')
block_time8 = BlockTime.find_or_create_by(start: '16:00', end: '17:00')
block_time9 = BlockTime.find_or_create_by(start: '17:00', end: '18:00')
block_time10 = BlockTime.find_or_create_by(start: '18:00', end: '19:00')
block_time11 = BlockTime.find_or_create_by(start: '19:00', end: '20:00')
block_time12 = BlockTime.find_or_create_by(start: '20:00', end: '21:00')
block_time13 = BlockTime.find_or_create_by(start: '21:00', end: '22:00')

worker1.work_days.clear
worker1.work_days << work_day1
worker1.work_days << work_day2
worker1.work_days << work_day3
worker1.work_days << work_day4
worker1.work_days << work_day5
worker1.work_days << work_day6
worker1.work_days << work_day7

worker2.work_days.clear
worker2.work_days << work_day2
worker2.work_days << work_day3
worker2.work_days << work_day4
worker2.work_days << work_day5
worker2.work_days << work_day6

worker3.work_days.clear
worker3.work_days << work_day2
worker3.work_days << work_day3
worker3.work_days << work_day4
worker3.work_days << work_day5
worker3.work_days << work_day6

worker4.work_days.clear
worker4.work_days << work_day1
worker4.work_days << work_day2
worker4.work_days << work_day3
worker4.work_days << work_day4
worker4.work_days << work_day5
worker4.work_days << work_day6
worker4.work_days << work_day7

worker1.block_times.clear
worker1.block_times << block_time1
worker1.block_times << block_time2
worker1.block_times << block_time8
worker1.block_times << block_time7
worker1.block_times << block_time6

worker2.block_times.clear
worker2.block_times << block_time1
worker2.block_times << block_time2
worker2.block_times << block_time3
worker2.block_times << block_time4
worker2.block_times << block_time5

worker3.block_times.clear
worker3.block_times << block_time13
worker3.block_times << block_time12
worker3.block_times << block_time11
worker3.block_times << block_time10
worker3.block_times << block_time9

worker4.block_times.clear
worker4.block_times << block_time13
worker4.block_times << block_time12
worker4.block_times << block_time11
worker4.block_times << block_time10
worker4.block_times << block_time9


AdminUser.create!(email: 'julio1741@gmail.com', password: '12345678', password_confirmation: '12345678') 
AdminUser.create!(email: 'roqueheliarenas@gmail.com', password: '12345678', password_confirmation: '12345678')