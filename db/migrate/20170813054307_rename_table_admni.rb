class RenameTableAdmni < ActiveRecord::Migration[5.0]
  def change
    rename_table :admin, :admins
  end
end
