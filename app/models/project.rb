class Project < ActiveRecord::Base
  has_many :items

  def done?
    items.where(opened: true).blank?
  end

  def items_by_days
    items.group_by{ |item| item.created_at.to_date }
  end

  def recent_items
    items.where('created_at >= ?', Time.zone.now.beginning_of_day)
  end
end
