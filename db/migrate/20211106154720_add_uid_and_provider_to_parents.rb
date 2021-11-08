class AddUidAndProviderToParents < ActiveRecord::Migration[6.1]
  def change
    add_column :parents, :uid, :string
    add_column :parents, :provider, :string
  end
end
