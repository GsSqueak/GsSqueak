panes
replacePane: oldPane with: newPane 
	"Make newPane exactly occupy the position and extent of oldPane"
	| _gsSqueakTemp_aLayoutFrame _gsSqueakTemp_hadDep |
	_gsSqueakTemp_hadDep := model dependents includes: oldPane.
	oldPane owner replaceSubmorph: oldPane by: newPane.
	newPane position: oldPane position;
		 extent: oldPane extent.
	_gsSqueakTemp_aLayoutFrame := oldPane layoutFrame.
	paneMorphs := paneMorphs
				collect: [:each | each == oldPane
						ifTrue: [newPane]
						ifFalse: [each]].
	_gsSqueakTemp_aLayoutFrame
		ifNotNil: [newPane layoutFrame: _gsSqueakTemp_aLayoutFrame].
	newPane color: Color transparent.
	_gsSqueakTemp_hadDep
		ifTrue: [model removeDependent: oldPane.
			model addDependent: newPane].
	self changed