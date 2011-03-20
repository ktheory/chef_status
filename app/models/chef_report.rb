class ChefReport < ActiveRecord::Base

  scope(:live) { where("updated_at >= ?", Time.now - REPORTING_INTERVAL) }
  scope(:missing) { where("updated_at < ?", Time.now - REPORTING_INTERVAL) }
  scope(:successful) live.where(:success => true)
  scope(:failing) live.where(:success => false)

  validates :node, :uniqueness => true, :presence => true

  def missing?
    updated_at < Time.now - REPORTING_INTERVAL
  end
end
