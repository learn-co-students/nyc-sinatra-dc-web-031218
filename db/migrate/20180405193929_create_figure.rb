class CreateFigure < ActiveRecord::Migration[5.1]
  def change
  	create_table(:figures) do |t|
  		t.string :name
  		t.timestamps
  	end
  end
end
