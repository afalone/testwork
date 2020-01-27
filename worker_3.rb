require './worker'
class Worker3 < Worker
  include SuckerPunch::Job

  workers 3
end
