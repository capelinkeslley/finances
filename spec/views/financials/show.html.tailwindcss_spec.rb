# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'financials/show', type: :view do
  before(:each) do
    assign(:financial, Financial.create!(
                         month: 'Month',
                         year: 'Year',
                         value: '9.99'
                       ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Month/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/9.99/)
  end
end
