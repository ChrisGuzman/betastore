class AddVerifiedToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :verfied_at, :timestamp
  end
end
