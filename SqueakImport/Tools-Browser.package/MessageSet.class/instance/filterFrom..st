filtering
filterFrom: aBlock
	"Filter the receiver's list down to only those items that satisfy aBlock, which takes a class an a selector as its arguments."

	| newList |
	newList := messageList select:
		[:anElement |
			self class parse: anElement toClassAndSelector: [ :cls :sel | 
				(self class isPseudoSelector: sel) not and: [  aBlock value: cls value: sel ]]].
	self setFilteredList: newList