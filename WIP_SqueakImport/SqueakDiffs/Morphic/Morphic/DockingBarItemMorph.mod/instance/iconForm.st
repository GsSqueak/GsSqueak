as yet unclassified
iconForm
	"private - answer the form to be used as the icon"
	^isEnabled
		ifTrue: [
			(isSelected and: [ selectedIcon notNil ])
				ifTrue: [ selectedIcon ]
				ifFalse: [ icon ] ]
		ifFalse: [
			icon asGrayScale ]