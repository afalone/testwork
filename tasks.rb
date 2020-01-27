require 'sucker_punch'
require './workers'
class Task
  attr_reader :complexity, :prio

  def initialize(complexity:, prio: 0)
    @complexity = complexity
    @prio = prio
  end

  def self.list
    stats = SuckerPunch::Queue.stats
    stats.each_with_object({tasks: {}, workers: {}}) do |(_name, stat), rez|
      rez[:tasks][:processed] ||= 0
      rez[:tasks][:processed] += stat['jobs']['processed']
      rez[:tasks][:running] ||= 0
      rez[:tasks][:running] += stat['workers']['busy']
      rez[:tasks][:enqueued] ||= 0
      rez[:tasks][:enqueued] += stat['jobs']['enqueued']
      rez[:workers][:total] ||= 0
      rez[:workers][:total] += stat['workers']['total']
      rez[:workers][:busy] ||= 0
      rez[:workers][:busy] += stat['workers']['busy']
      rez[:workers][:idle] ||= 0
      rez[:workers][:idle] += stat['workers']['idle']
    end
  end

  def shoot
    handler = Class.const_get("Worker#{prio + 1}")
    handler.perform_async(complexity)
    true
  end
end
