selected object
selectedObject
	"answer the selected object for the hand or nil is none"
	
	^self halo ifNotNil: [ :halo | halo target renderedMorph ]