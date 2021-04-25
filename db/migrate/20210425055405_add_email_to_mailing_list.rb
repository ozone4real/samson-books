class AddEmailToMailingList < ActiveRecord::Migration[5.2]
  def change
    remove_column :mailing_list, :mailing_list
    add_column :mailing_list, :email, :string
  end
end
