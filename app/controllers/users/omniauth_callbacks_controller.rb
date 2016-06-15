
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def azure_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)

    @user = User.find_by_email request.env['omniauth.auth']['info']['email']

    if @user
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      return set_flash_message(:notice, :success, :kind => 'Office 365') if is_navigational_format?
    end

    azure_user = RestClient::Resource.new('https://graph.microsoft.com/v1.0/me', headers: {Authorization: "Bearer #{request.env["omniauth.auth"][:credentials][:token]}"})

    # First check if it's a company administrator
    direct_memberships = JSON.parse(azure_user['/memberOf'].get.body)

    is_admin = false
    direct_memberships['value'].each do |group|
      if group['@odata.type'] == '#microsoft.graph.directoryRole' and group['roleTemplateId'] == '62e90394-69f5-4237-9190-012177145e10'
        is_admin = true
        break
      end
    end

    if is_admin
      pass = SecureRandom.hex
      @user = User.create! email: request.env['omniauth.auth']['info']['email'], password: pass, password_confirmation: pass
    end

    # Check if he is member of authorized groups
    # TODO: Write code for that

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => 'Office 365') if is_navigational_format?
    else
      set_flash_message(:notice, :failure, :kind => 'Office 365') if is_navigational_format?
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end