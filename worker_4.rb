require './worker'
class Worker4 < Worker
  include SuckerPunch::Job

  workers 4
end
