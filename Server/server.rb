require 'faye'

bayeux = Faye::RackAdapter.new(:mount => '/hub', :timeout => 25)
bayeux.listen(9292)