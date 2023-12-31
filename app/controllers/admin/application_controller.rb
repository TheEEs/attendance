# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    include Clearance::Controller
    include Administrate::Punditize

    before_action :require_login

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    helper_method :render_record

    def render_record
      render partial: "collection_record", locals: { collection_presenter: collection_presenter,
                                                     collection_field_name: collection_field_name, page: page, namespace: namespace, resource:
                        resource, table_title: "page-title" }
    end

    def destroy
      authorize_resource(requested_resource)
      detach_params = self.detach_params
      @detach = detach_params[:detach] == "true" and @detach_class = detach_params[:parent_class] and @detach_id = detach_params[:parent_id]
      unless @detach
        if requested_resource.destroy
          flash[:notice] = translate_with_resource("destroy.success")
        else
          flash[:error] = requested_resource.errors.full_messages.join("<br/>")
        end
        if (redirect_url = detach_params[:redirect_url]).nil?
          redirect_to after_resource_destroyed_path(requested_resource)
        else
          redirect_to redirect_url
        end
      else
        @detach_class = @detach_class.pluralize
        if @parent_records = requested_resource.send(@detach_class).delete(@detach_id)
          flash.now[:notice] = translate_with_resource("detach.success")
        else
          flash.now[:error] = requested_resource.errors.full_messages.join("<br/>")
        end
        redirect_to "#{url_for([namespace, @parent_records.first])}?#{pagination_params(resource_name.name)}"
      end
    end

    def create
      resource = new_resource(resource_params)
      authorize_resource(resource)
      if resource.respond_to? :user=
        resource.user = current_user
      end
      if resource.save
        redirect_to(
          after_resource_created_path(resource),
          notice: translate_with_resource("create.success"),
        )
      else
        render turbo_stream: [
          turbo_stream.replace(resource, partial: "form", locals: {
                                 page: Administrate::Page::Form.new(dashboard, resource)
                               })
        ], status: :unprocessable_entity

      end
    end

    def show
      super
    end

    private

    def detach_params
      params.permit(:detach, :parent_id, :parent_class, :redirect_url)
    end

    helper_method :query_string

    helper_method :pagination_params
    def pagination_params(name)
      params.permit(name.pluralize => {}).to_query
    end

    private

    def query_string
      request.query_string
    end
  end
end
