require './worker'
class Worker2 < Worker
  include SuckerPunch::Job

  workers 2
end
