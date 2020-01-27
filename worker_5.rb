require './worker'
class Worker5 < Worker
  include SuckerPunch::Job

  workers 5
end
