class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :x_user_id
      t.integer :o_user_id
      t.text :grid, array: true, default: [nil, nil, nil, nil, nil, nil, nil, nil, nil]
      t.timestamps
    end
  end
end
