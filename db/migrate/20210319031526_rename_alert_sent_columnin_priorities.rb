class RenameAlertSentColumninPriorities < ActiveRecord::Migration[6.0]
  def change
    rename_column :priorities, :alert_sent, :priority_accomplished
  end
end
