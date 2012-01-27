class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.boolean :is_published
      t.integer :template_id
      t.integer :repo_id
      t.integer :sort_key

      t.timestamps
    end
  end
end
