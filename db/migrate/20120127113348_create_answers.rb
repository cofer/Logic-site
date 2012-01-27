class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :title
      t.text :text
      t.text :correct

      t.timestamps
    end
  end
end
