class Mailer
  include SendGrid

  class << self
    include ActiveModel::Naming

    def client
      @client ||= SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    end
  end

  def initialize(emails, subject, template)
    @personalization = Personalization.new
    @mail = SendGrid::Mail.new
  end

  def mail(to:, subject:, cc: nil, bcc: nil)
    Array(to).each {|e| @personalization.add_to(e) }
    Array(cc).each {|c| @personalization.add_cc(c) } if cc
    Array(bcc).each {|b| @personalization.add_cc(b) } if bcc
    @personalization.subject = subject
  end

  private

  def template
    @template ||= ERB.new(File.read("./views/#{self.class.name.underscore}.erb")).result
  end
end