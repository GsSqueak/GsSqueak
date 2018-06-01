selecting
selectWindowIndex: index
	| currentModel newModel newModelState |
	index = currentModelIndex ifTrue: [^self].

	currentModel := models at: currentModelIndex.
	newModel := models at: index.
	modelDependents addAll: currentModel dependents.
	modelStates at: currentModelIndex put: { currentModel saveMultiWindowState. self editState }.
	"the become makes things confusing.  currentModel will end up being newModel and vice verce"
	models swap: currentModelIndex with: index.
	currentModel become: newModel.
	currentModel := models at: currentModelIndex.
	newModel := models at: index.
	newModel myDependents: (DependentsArray withAll: modelDependents asArray).
	currentModel myDependents: nil.
	"Change currentModelIndex before restoreMultiWIndowState: so label index is shown correctly"
	currentModelIndex := index.
	newModelState := modelStates at: index.
	newModelState first ifNotNil: "emptyState has nil for savedModelState.  Don;t restore state for a new window"
		[:savedModelState| newModel restoreMultiWindowState: savedModelState].
	self restoreEditState: newModelState last.
	modelStates at: index put: nil.
	newModel changed: #relabel