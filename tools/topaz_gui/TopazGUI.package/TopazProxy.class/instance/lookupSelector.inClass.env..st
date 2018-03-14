commands
lookupSelector: selector inClass: class env: envId

	^ self command: 'lookup ' , class , ' >> ' , selector , Character space , envId