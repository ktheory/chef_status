class ChefReport < ActiveRecord::Base

  default_scope order('node ASC')
  scope :live,      lambda { where("updated_at >= ?", Time.now.utc - REPORTING_INTERVAL) }
  scope :offline,   lambda { where("updated_at <  ?", Time.now.utc - REPORTING_INTERVAL) }
  scope :converged, live.where(:success => true)
  scope :failing,   live.where(:success => false)

  validates :node, :uniqueness => true, :presence => true

  # Update timestamps even if no other attributes changed
  after_save :touch

  def self.status_hash
    all.inject({}){|hash, report| hash[report.node] = report.status; hash}
  end

  # Returns 'ok', 'failed', or 'missing'
  def status
    return 'offline' if offline?
    success? ? 'converged' : 'failing'
  end

  def offline?
    updated_at < Time.now - REPORTING_INTERVAL
  end
end
