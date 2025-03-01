# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Admin::PartnerTypes', type: :feature do
  let(:admin) { create(:admin_user) }
  let(:partner_type) { create(:partner_type) }

  before { sign_in admin }

  describe '#index' do
    before do
      @types = create_list(:partner_type, 5)
    end

    it 'can see all types' do
      visit admin_partner_types_path
      @types.each { |type| expect(page).to have_content(type.name) }
    end
  end

  describe '#new' do
    it 'can add new partner type' do
      visit new_admin_partner_type_path
      fill_in 'partner_type_name', with: 'Example'
      click_button '新增Partner type'
      expect(page).to have_content('Example')
    end
  end

  describe '#edit' do
    before { @type = create(:partner_type) }

    it 'can edit partner type' do
      visit edit_admin_partner_type_path(@type)
      fill_in 'partner_type_name', with: 'New Type Name'
      click_button '更新Partner type'
      expect(page).to have_content('New Type Name')
    end
  end

  describe '#destroy' do
    before { @type = create(:partner_type) }

    it 'can destroy partner type' do
      visit admin_partner_types_path

      within first('td', text: @type.name).first(:xpath, './/..') do
        click_on 'Destroy'
      end

      expect(page).not_to have_content(@type.name)
    end
  end
end
