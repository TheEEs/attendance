class AttendController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @conference = Conference.preload(:attends).find(conference_id)
    @qrCode = RQRCode::QRCode.new url_for(controller: :attend, action: :attend, :conference_id => @conference.hashid)
  end

  def attend
    @conference = Conference.eager_load(:attends).find(conference_id)
  end

  def make_attend
    @attend = Attend.find(attend_id) rescue nil
    if @attend&.update(attended: true)
      @conference = @attend.conference 
      session[:attending_conference] = @conference.hashid
      respond_to do |format|
        format.html {
          redirect_to attend_path(@conference)
        }
        format.turbo_stream {
          render "success_attend"
        }
      end
    else
      flash.now["error"] = t("application.actions.attend.failed")
      render turbo_stream: [
        turbo_stream.replace("flashes", partial: "admin/application/flashes")
      ]
    end
  end

  private

  def conference_id
    params[:conference_id]
  end

  def attend_id 
    params[:attend_id]
  end

  helper_method :attended_conference

  def attended_conference
    session[:attending_conference]
  end
end
