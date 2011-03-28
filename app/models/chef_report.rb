class ChefReport < ActiveRecord::Base

  default_scope order('node ASC')
  scope :live,    lambda { where("updated_at >= ?", Time.now - REPORTING_INTERVAL) }
  scope :missing, lambda { where("updated_at < ?", Time.now - REPORTING_INTERVAL) }
  scope :ok,      live.where(:success => true)
  scope :failed,  live.where(:success => false)

  validates :node, :uniqueness => true, :presence => true

  # Update timestamps even if no other attributes changed
  after_save :touch

  def self.status_hash
    all.inject({}){|hash, report| hash[report.node] = report.status; hash}
  end

  # Returns 'ok', 'failed', or 'missing'
  def status
    return 'missing' if missing?
    success? ? 'ok' : 'failed'
  end

  def missing?
    updated_at < Time.now - REPORTING_INTERVAL
  end
end
