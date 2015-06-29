class Users::RegistrationsController < Devise::RegistrationsController

    # GET /resource/sign_up
    def new
        session[:user] ||= { }
        @user = build_resource(session[:user])
        @wizard = ClientRegistrationWizard.new(current_step)

        respond_with @user
    end

    # GET /clients/sign_up
    def new_client
        session[:user] ||= { }
        session[:user]['role'] = :client
        @user = build_resource(session[:user])
        @wizard = ClientRegistrationWizard.new(current_step)

        render 'new_client'
    end

    # GET /members/sign_up
    def new_member
      # same
    end

    # POST /clients/sign_up
    # POST /members/sign_up
    def create
        session[:user].deep_merge!(params[:user]) if params[:user]
        @user = build_resource(session[:user])
        @wizard = ClientRegistrationWizard.new(current_step)

        if params[:previous_button]
            @wizard.previous
        elsif @user.valid?(@wizard)
            if @wizard.last_step?
                @user.save if @user.valid?
            else
                @wizard.next
            end
        end

        session[:registration_current_step] = @wizard.current_step

        if @user.new_record?
            clean_up_passwords @user
            render 'new_client'
        else
            #session[:registration_current_step] = nil
            session[:user_params] = nil

            if @user.active_for_authentication?
                set_flash_message :notice, :signed_up if is_navigational_format?
                sign_in(:user, @user)
                respond_with @user, :location => after_sign_up_path_for(@user)
            else
                set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_navigational_format?
                expire_session_data_after_sign_in!
                respond_with @user, :location => after_inactive_sign_up_path_for(@user)
            end
        end

    end

    private

    def current_step
        if params[:wizard] && params[:wizard][:current_step]
            return params[:wizard][:current_step]
        end
        return session[:registration_current_step]
    end

end