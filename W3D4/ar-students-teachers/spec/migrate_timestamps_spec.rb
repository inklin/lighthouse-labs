require_relative 'spec_helper'

describe 'add timestamps' do
  it 'should have the right columns and types' do
    expected_cols = ['created_at', 'updated_at']
    found_cols = []
    ActiveRecord::Base.connection.columns(:students).each do |col|
      if expected_cols.include?(col.name)
        expect(col.type).to eq(:datetime)
        found_cols << col.name
      end
    end
    expect(found_cols).to eq(expected_cols)
  end
end
