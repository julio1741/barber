# frozen_string_literal: true

json.block_times do
  json.array! @block_times
end
json.work_day_id @work_day.try(:id)
