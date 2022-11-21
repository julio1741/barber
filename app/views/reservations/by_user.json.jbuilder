# frozen_string_literal: true
json.old do
  json.partial! 'reservation', reservations: @old_reservations
end

json.current do
  json.partial! 'reservation', reservations: @current_reservations
end
