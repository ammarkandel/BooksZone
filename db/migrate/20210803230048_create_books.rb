class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :progress
      t.string :status, null: false, default: "reading"
      t.string :privacy, null: false, default: "private"
      t.belongs_to :user

      t.timestamps
    end
  end
end
