class ChefReport < ActiveRecord::Base

  default_scope order('node DESC')
  scope :live,    lambda { where("updated_at >= ?", Time.now - REPORTING_INTERVAL) }
  scope :missing, lambda { where("updated_at < ?", Time.now - REPORTING_INTERVAL) }
  scope :ok,      live.where(:success => true)
  scope :failed,  live.where(:success => false)

  validates :node, :uniqueness => true, :presence => true

  after_save :touch

  def to_param
    node
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
