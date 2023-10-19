class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :judul
      t.date :tahun_terbit
      t.integer :author_id

      t.timestamps
    end
  end
end
