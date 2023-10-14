# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'financials/index', type: :view do
  before(:each) do
    assign(:financials, [
             Financial.create!(
               month: 'Month',
               year: 'Year',
               value: '9.99'
             ),
             Financial.create!(
               month: 'Month',
               year: 'Year',
               value: '9.99'
             )
           ])
  end

  it 'renders a list of financials' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Month'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Year'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
  end
end
