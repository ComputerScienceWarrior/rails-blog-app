class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :content
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
