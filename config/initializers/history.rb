if History.count >=1
	$history = History.first
else
	$history= History.create
end
puts $history
