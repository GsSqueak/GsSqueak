private
setClassAndSelectorIn: csBlock
	"Evaluate csBlock with the selected methodReference, or return nil if there's nothing selected."

	^((self methodReferences at: self messageListIndex) ifNil: [ ^nil ])
		setClassAndSelectorIn: csBlock