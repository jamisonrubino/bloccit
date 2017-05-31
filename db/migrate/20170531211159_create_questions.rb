class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.string :title
      t.boolean :resolved

      t.timestamps null: false
    end
  end
end
