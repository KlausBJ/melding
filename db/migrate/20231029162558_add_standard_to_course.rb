class AddStandardToCourse < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :standard, null: false, foreign_key: true
  end
end
