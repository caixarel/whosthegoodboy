class ChangeDataTypeForaccepted < ActiveRecord::Migration[6.1]
  def change
    change_column :offers, :accepted, :string
  end
end
