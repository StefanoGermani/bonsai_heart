class CreateBonsais < ActiveRecord::Migration
  def change
    create_table :bonsais do |t|
      t.string :name

      t.timestamps
    end
  end
end
