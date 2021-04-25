class MailingList < ApplicationRecord
  self.table_name = :mailing_list

  def to_s
    email
  end
end