class AddUniqConstraintToBooksId < ActiveRecord::Migration[7.1]
  def up
    execute 'ALTER TABLE books ADD CONSTRAINT unique_id UNIQUE (id);'
  end
  
  def down
    execute 'ALTER TABLE books DROP CONSTRAINT unique_id;'
  end
end


