require 'rinda/ring'
require 'drb'

DRb.start_service
ts = Rinda::RingFinger.primary
length = []
sentence = []
loop do 
	ts.write[:result] # wysylam zadanie do klientow o wynik
	t = ts.read[:result,nil, nil], 2 # odbieram wynik od klientow i czekam 2 sek
  (length = t[1] and sentence = t[2]) if length > t[1] # zapisuje wyniki jezeli sa mniejsze 
  p "#{sentence} - #{length}"
	break if t == 0 
end