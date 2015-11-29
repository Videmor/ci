class AddStateToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :state, :boolean
  end
end
