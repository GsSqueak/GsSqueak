printing
printOn: aStream

	[aStream
			nextPutAll: self hostNumber;
			nextPut: $(; nextPutAll: self hostName; nextPut: $);
			nextPut: $,;
			nextPutAll: self serviceNumber;
			nextPut: $(; nextPutAll: self serviceName; nextPut: $)]
		on: Error "e.g. inspector on address from a previous session"
		do: [aStream nextPutAll: 'an invalid ';
				nextPutAll: self class name;
				nextPut: Character space.
			^super printOn: aStream]