class Facilitators::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  def new
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js do
        @resource = resource_class.new(sign_in_params)
        clean_up_passwords(@resource)
      end
    end
  end

  def create
    self.resource = warden.authenticate(auth_options)
    if resource
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      redirect_to facilitator_root_path, turbolinks: true
    else
      @resource = resource_class.new(sign_in_params).tap { |r| r.errors.add(:base, 'Invalid email/password') }
      render :new
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
