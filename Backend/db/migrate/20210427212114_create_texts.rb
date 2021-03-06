class CreateTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :texts do |t|
      t.string :body
      t.string :messaging_service_sid
      t.string :to
      t.string :from
      t.string :direction
      t.string :sid
      t.string :account_sid
      t.belongs_to :user

      t.timestamps
    end
  end
end
