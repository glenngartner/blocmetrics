class RenameApplicationsTableToResteredapplications < ActiveRecord::Migration
  def change
    rename_table:applications, :registeredapplications
  end
end
