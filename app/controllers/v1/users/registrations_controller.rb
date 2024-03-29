module V1
  module Users
    class RegistrationsController < Devise::RegistrationsController
      private

      def respond_with(resource, _opts = {})
        register_success && return if resource.persisted?

        register_failed
      end

      def register_success
        render_okay({message: 'Signed up sucessfully.'})
      end

      def register_failed
        render_error(errors: resource.errors.full_messages)
      end
    end
  end
end
