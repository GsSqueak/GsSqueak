private
hostName

	^ self connectionInfo at: #hostName ifAbsent: [NetNameResolver nameForAddress: self host]