class Admin::WithdrawalsController < ApplicationController
  before_action :require_admin

  def index
    @withdrawals = Withdrawal.all
  end

  def update
    # Authorizes a withdrawal by an admin by attaching a signature
    Withdrawal.find(params[:id]).sign_by!(current_user)
  end
end