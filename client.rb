require 'rinda/ring'
require 'drb'
require 'rinda/tuplespace'  

DRb.start_service
ts = Rinda::TupleSpaceProxy.new(DRbObject.new_with_uri('druby://127.0.0.1:6666'))
length = []
sentence = []
loop do 
	ts.write([:result,nil]) # wysylam zadanie do klientow o wynik
	t = ts.take([:result,nil, nil]) # odbieram wynik od klientow i czekam 2 sek
	sleep 2
  (length = t[1] and sentence = t[2]) if length > t[1] # zapisuje wyniki jezeli sa mniejsze 
  p "#{sentence} - #{length}"
	break if t == 0 
end
