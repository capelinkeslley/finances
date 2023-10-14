# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'financials/new', type: :view do
  before(:each) do
    assign(:financial, Financial.new(
                         month: 'MyString',
                         year: 'MyString',
                         value: '9.99'
                       ))
  end

  it 'renders new financial form' do
    render

    assert_select 'form[action=?][method=?]', financials_path, 'post' do
      assert_select 'input[name=?]', 'financial[month]'

      assert_select 'input[name=?]', 'financial[year]'

      assert_select 'input[name=?]', 'financial[value]'
    end
  end
end
