class RenameOrderIdColumnToBuyers < ActiveRecord::Migration[6.0]
  def change
    rename_column :buyers, :order_id, :item_id
  end
end
