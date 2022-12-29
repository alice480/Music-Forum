class Admin < ApplicationRecord
  def receive(record)
    @admin = Admin.find_by(id: record)
    [@admin.topic, @admin.text, @admin.path] 
  end
end
