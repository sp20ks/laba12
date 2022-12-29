# frozen_string_literal: true

class CreateElements < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.string :arr
      t.integer :length
      t.string :res_arr
      t.string :max_subarr

      t.timestamps
    end
  end
end
