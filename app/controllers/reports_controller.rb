class ReportsController < ApplicationController
  def index
    @reports = Dir['public/reports/*']
  end

  def create
    ReportCodeJob.perform_later

    flash[:notice] = "Estamos processando seu relatório"
    redirect_to '/reports'
  end
end
