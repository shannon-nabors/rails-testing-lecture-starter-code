class CreateFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :flags do |t|
      t.string :region
      t.string :info
      t.string :image_url
      t.integer :rating

      t.timestamps
    end
  end
end
