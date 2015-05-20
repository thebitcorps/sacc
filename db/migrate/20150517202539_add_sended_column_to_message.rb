class AddSendedColumnToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :sended, :boolean, default: false
  end
end
