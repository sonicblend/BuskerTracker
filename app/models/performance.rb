class Performance < ActiveRecord::Base
  belongs_to :busker

  validate :ensure_end_date_after_start_date

  def ensure_end_date_after_start_date
    errors.add(:end_date, "must occur after the start date") if
      end_date.present? and end_date <= start_date
  end
end
