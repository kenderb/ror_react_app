# frozen_string_literal: true

every :monday, at: '12pm' do
  rake 'populate_db'
end
