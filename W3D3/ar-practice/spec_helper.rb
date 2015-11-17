puts "Setting up Connection..."

require 'pg'
require 'active_record'

require './models/guest'
require './models/room'
require './models/booking'

puts 'Connecting to DB...'

ActiveRecord::Base.establish_connection(
  database: 'db/example.db',
  adapter: 'sqlite3',
  )

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'guests'
    create_table :guests do |t|
      t.column :name, :string
    end
  end

  unless ActiveRecord::Base.connection.tables.include? 'rooms'
    create_table :rooms do |t|
      t.column :number, :string
    end
  end

  unless ActiveRecord::Base.connection.tables.include? 'bookings'
    create_table :bookings do |t|
      t.column :start_date, :datetime
      t.column :end_date, :datetime
      t.column :room_id, :integer
      t.column :guest_id, :integer
    end
  end
end
