message list
hasMessageSelected

	^super hasMessageSelected and: [
		(self methodReferences at: self messageListIndex) notNil ]