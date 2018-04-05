class CreateLandmarks < ActiveRecord::Migration[4.2]
  def change
  	create_table(:landmarks) do |t|
  		t.string :name
  		t.integer :figure_id
  		t.integer :year_completed
  		t.timestamps
  	end
  end
end
