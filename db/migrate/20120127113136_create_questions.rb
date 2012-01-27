class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :variant
      t.boolean :is_published
      t.string :type
      t.integer :sort_key

      t.timestamps
    end
  end
end
