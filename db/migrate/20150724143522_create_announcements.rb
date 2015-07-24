class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|

      t.string :image

      t.timestamps null: false
    end
  end
end
