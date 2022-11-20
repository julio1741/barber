# frozen_string_literal: true

json.array! @reservations do |reservation|
  json.id reservation.id
  json.day reservation.day
  json.email reservation.email
  json.phone reservation.phone

  user = reservation.user
  json.user do
    json.id user.id
    json.name user.name
  end

  worker = reservation.worker
  json.worker do
    json.id worker.id
    json.name worker.name
    json.instagram worker.instagram
    json.image_url worker.image_url
  end

  service = reservation.service
  json.service do
    json.id service.id
    json.name service.name
    json.description service.description
    json.price service.price
  end

  work_day = reservation.service
  json.work_day do
    json.id work_day.id
    json.name work_day.name
  end

  block_time = reservation.block_time
  json.block_time do
    json.id block_time.id
    json.start block_time.start
    json.end block_time.end
  end

end