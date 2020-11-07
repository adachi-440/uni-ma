# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.find_by(confirmation_token: params[:confirmation_token])

    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      sign_in(resource)
      redirect_to new_users_main_registration_path, notice: 'メールアドレスを確認しました。'
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :show }
    end
  end

  protected

  #
  # # The path used after resending confirmation instructions.
  # # def after_resending_confirmation_instructions_path_for(resource_name)
  # #   render 'confirmations/show'
  # # end
  #
  # # The path used after confirmation.
end
