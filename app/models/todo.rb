# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Todo < ActiveRecord::Base
  validates :title, presence: true
end
