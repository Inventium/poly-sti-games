class CreateCasinos < ActiveRecord::Migration[5.0]
  def change
    create_table :casinos do |t|
      t.name
      t.timestamps
    end
  end
end
