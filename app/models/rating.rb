# == Schema Information
#
# Table name: ratings
#
#  id             :integer          not null, primary key
#  emotion        :integer
#  comment        :text
#  performance_id :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :performance

  enum emotion: [ :love, :splendid, :meh, :ennui, :wtf, :rage ]
end
