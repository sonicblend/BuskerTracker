# == Schema Information
#
# Table name: performances
#
#  id          :integer          not null, primary key
#  start_date  :datetime
#  end_date    :datetime
#  amplified   :boolean
#  busker_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#

class Performance < ActiveRecord::Base
  belongs_to :busker
  belongs_to :location

  validate :ensure_end_date_after_start_date

  def ensure_end_date_after_start_date
    errors.add(:end_date, "must occur after the start date") if
      end_date.present? and end_date <= start_date
  end
end
