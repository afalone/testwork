require './worker'
class Worker1 < Worker
  include SuckerPunch::Job

  workers 1
end
