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
  has_many   :ratings

  validate :ensure_end_date_after_start_date

  def to_s
    date_format = '%d-%m-%Y %H:%M'
    start_date.strftime(date_format) + ' - ' + end_date.strftime(date_format) + ' - ' + Busker.find_by_id(busker_id).name
  end

  private
  def ensure_end_date_after_start_date
    errors.add(:end_date, "must occur after the start date") if
      end_date.present? and end_date <= start_date
  end
end
