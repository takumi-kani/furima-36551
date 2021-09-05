class RenameItemIdColumnToBuyers < ActiveRecord::Migration[6.0]
  def change
    rename_column :buyers, :item_id, :ored
  end
end
