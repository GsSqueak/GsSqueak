A SavedMultiWindowState is a collection of states of inactive windows for a multi-window tool ui where one can select between multiple copies of a tool sharing a single system window, each tol having its own state.  It manages switching between windows, swapping unaccepted edit state (e.g. in text views) as it does so.

Instance Variables
	currentModelIndex:		<Integer>
	modelDependents:		<IdentitySet>
	modelStates:			<OrderedCollection of: (Array
													with: modelState <Object>
													with: unacceptedEditStates <WeakIdentityKeyDictionary>) >
	models:					<OrderedCollection of: Model>

currentModelIndex
	- index into models and modelStates of current window selection

modelDependents
	- set of all dependents

modelStates
	- the pairs of model-specific selection state and widget-specfic unaccepted edit state for each unselected/inactive window

models
	- the models for each window
