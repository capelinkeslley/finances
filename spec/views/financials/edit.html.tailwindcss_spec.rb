# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'financials/edit', type: :view do
  let(:financial) do
    Financial.create!(
      month: 'MyString',
      year: 'MyString',
      value: '9.99'
    )
  end

  before(:each) do
    assign(:financial, financial)
  end

  it 'renders the edit financial form' do
    render

    assert_select 'form[action=?][method=?]', financial_path(financial), 'post' do
      assert_select 'input[name=?]', 'financial[month]'

      assert_select 'input[name=?]', 'financial[year]'

      assert_select 'input[name=?]', 'financial[value]'
    end
  end
end
