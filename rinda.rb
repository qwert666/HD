require 'drb'
require 'rinda/ring'
require 'rinda/tuplespace'

ts = Rinda::TupleSpace.new
DRb.start_service("druby://127.0.0.1:6666",nil)
Rinda::RingServer.new(ts)
Signal.trap("INT"){DRb.stop_service}
DRb.thread.join