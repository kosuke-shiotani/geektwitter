class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
