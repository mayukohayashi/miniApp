class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false, unique: true, index: true
      t.string :family_name, null: false
      t.string :first_name
      t.string :place
      t.text   :body
      t.timestamps
    end
  end
end
