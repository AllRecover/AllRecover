class DetailController < ApplicationController

  def index
    @chats = Chat.all

    #@new_chats = current_user.messages.build
  end
  def chat

  end

end
