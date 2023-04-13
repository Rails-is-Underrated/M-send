class ReportsController < ApplicationController
  
  def index

    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    @transactions = current_user.sent_transactions
      .where(created_at: start_date.beginning_of_day..end_date.end_of_day)
      .or(current_user.received_transactions.where(created_at: start_date.beginning_of_day..end_date.end_of_day))
      
    # send reports

    ReportMailer.send_report(current_user, @transactions ).deliver_later

    render json: { transactions: @transactions }

  end
end
