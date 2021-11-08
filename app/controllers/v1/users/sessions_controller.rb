module V1
  module Users
    class SessionsController < Devise::SessionsController
      private

      def respond_with(resource, _opts = {})
        if current_user
          render_okay({message: 'Logged in successfully.'})
        else
          render_unauthorized({message: 'Invalid email or password.'})
        end
      end

      def respond_to_on_destroy
        log_out_success && return if current_user

        log_out_failure
      end

      def log_out_success
        render_okay({message: 'Logged out successfully.'})
      end

      def log_out_failure
        render_unauthorized({message: 'You need to sign in before.'})
      end
    end
  end
end
