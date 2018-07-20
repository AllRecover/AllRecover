class ChatController < ApplicationController



  def index
    @chats = Chat.all
    #@new_chats = current_user.messages.build
  end

  def create
    msg = params[:chat]
    @chat = Chat.create(uidx: "1",hidx: "1",msg: msg)
    if  @chat.save
     respond_to do |format|
       format.html {redirect_to :back}
       format.js {render 'create_chat'}
     end
   else
     redirect_to :back
   end
  end

  def reset
    actual =params[:diff]
    actual =actual.to_i
    chats_re = Chat.all
    @ch = []
    if actual != chats_re.length
      diff = chats_re.length - actual
      @ch = chats_re[chats_re.length-diff..chats_re.length]
      p @ch
    end



    respond_to do |format|
      format.html {redirect_to :back}
      format.js {render 'reset_chat'}
    end
  end
  # private
  # def message_params
  #   params.require(:chat).permit(:body)
  # end
end
