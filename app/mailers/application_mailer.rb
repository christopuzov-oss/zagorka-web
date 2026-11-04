class ApplicationMailer < ActionMailer::Base
  
  layout 'mailer'
  
  def contact_mail(contact_info)
    @contact_info = contact_info
    @subject = 'Ново съобщение от контактна форма'
    mail(to: ['zagorka@heineken.com', 'teamzagorka@metrica.bg'], subject: @subject)
    
  end

  def career_mail(contact_info)
    @contact_info = contact_info
    @subject = 'Нова съобщение от Кариери'
    mail(to: 'career.bg@heineken.com', subject: @subject)
  end

  def signal_mail(contact_info)
    @contact_info = contact_info
    #attachments["attachment"] = File.read(@contact_info.file.path)
    
    @subject = 'Нов Сигнал за нередност'

    mail(to: ['signals.bulgaria@heineken.com'], subject: @subject)
  end



end
