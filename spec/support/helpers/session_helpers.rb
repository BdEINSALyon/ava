module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation)
      visit new_user_registration_path
      fill_in I18n.t('activerecord.attributes.user.email'), with: email
      fill_in t('activerecord.attributes.user.password'), with: password
      fill_in t('activerecord.attributes.user.password_confirmation'), :with => confirmation
      click_button 'Sign up'
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in t('activerecord.attributes.user.email'), with: email
      fill_in t('activerecord.attributes.user.password'), with: password
      click_button 'Sign in'
    end
  end
end
