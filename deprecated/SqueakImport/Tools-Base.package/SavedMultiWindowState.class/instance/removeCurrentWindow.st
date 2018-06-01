operations
removeCurrentWindow
	"Remove the current pane."
	| deletedIndex |
	self assert: models size > 1.
	self assert: models size = modelStates size.
	(models at: currentModelIndex) okToChange ifFalse:
		[^self].
	deletedIndex := currentModelIndex.
	self selectWindowIndex: (currentModelIndex = 1
								ifTrue: [currentModelIndex + 1]
								ifFalse: [currentModelIndex - 1]).
	models := models copyWithoutIndex: deletedIndex.
	modelStates :=  modelStates copyWithoutIndex: deletedIndex.
	currentModelIndex > deletedIndex ifTrue:
		[currentModelIndex := currentModelIndex - 1].
	(models at: currentModelIndex) changed: #relabel