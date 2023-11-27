class AttendController < ApplicationController
  def index
    @conference = Conference.preload(:attends).find(conference_id)
    @qrCode = RQRCode::QRCode.new url_for(controller: :attend, action: :attend, :conference_id => @conference.hashid)
  end

  def attend
    @conference = Conference.eager_load(:attends).find(conference_id)
  end

  def make_attend
    @attend = Attend.find(attend_id)
    @attend.update(attended: true)
    @conference = @attend.conference
    render "attend"
  end

  private

  def conference_id
    params[:conference_id]
  end

  def attend_id 
    params[:attend_id]
  end
end
