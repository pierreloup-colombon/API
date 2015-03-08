class RenameActivitieToActivityToTickets < ActiveRecord::Migration
  def change
    rename_column :tickets, :activitie_id, :activity_id
    end
  end
