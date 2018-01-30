simulation
tableLookup: table at: index 
	^ self long32At: table + (index * 4)