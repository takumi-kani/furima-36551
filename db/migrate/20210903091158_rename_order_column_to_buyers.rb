class RenameOrderColumnToBuyers < ActiveRecord::Migration[6.0]
  def change
    rename_column :buyers, :ored, :order_id
  end
end
