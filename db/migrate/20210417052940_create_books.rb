class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string(:name)
      t.string(:book_url)
      t.text(:summary)
      t.string(:image_url)
      t.timestamps
    end
  end
end
