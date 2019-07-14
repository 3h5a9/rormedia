class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact_me(@message).deliver_now
      redirect_to :contact, notice: "Message received, thanks!"
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
