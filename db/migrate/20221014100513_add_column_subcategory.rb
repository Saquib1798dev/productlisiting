class AddColumnSubcategory < ActiveRecord::Migration[6.0]
  def change
    unless ActiveRecord::Base.connection.column_exists?(:items, :category_id)
      add_reference :items, :category, index: true
    end
  end
end
