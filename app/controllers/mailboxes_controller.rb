class MailboxesController < ApplicationController
  before_action :authenticate_user!

  def index
    @mails = Mail.all
  end
  
  def new
    @mail = Mailbox.new
  end
  
  def create
    @mail = Mailbox.new(mail_params)
    if Mailbox.save
      redirect_to draft_mailboxes_path,notice: '成功儲存草稿'
    else
      render new, notice: '儲存失敗'
    end
  end
  
  def draft
    @mails = 
  end
  
  def send
    #將owner_id =>
    #將
  end
  
  def sent
  end
  
  def 
  end
  
  def 
  end
  

  private
  def mail_params
    params.require(:mailbox)
          .permit(:to, :title, :content)
          .merge(user: current_user)
  end

end
