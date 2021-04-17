class CreateMailingList < ActiveRecord::Migration[5.2]
  def change
    create_table :mailing_list do |t|
      t.string(:mailing_list)
      t.timestamps
    end
  end
end
