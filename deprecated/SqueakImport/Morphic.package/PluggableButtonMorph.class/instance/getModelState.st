private
getModelState
	"Answer the result of sending the receiver's model the getStateSelector message."

	^ getStateSelector 
		ifNil: [false]
		ifNotNil: [model perform: getStateSelector]