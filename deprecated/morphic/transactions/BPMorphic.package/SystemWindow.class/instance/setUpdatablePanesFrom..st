panes
setUpdatablePanesFrom: getSelectors 
	"Set my updatablePanes inst var to the list of panes which are list
	panes with the given get-list selectors. Order is important here! Note
	that the method is robust in the face of panes not found, but a
	warning is printed in the transcript in each such case"
	| _gsSqueakTemp_aList _gsSqueakTemp_possibles |
	_gsSqueakTemp_aList := OrderedCollection new.
	_gsSqueakTemp_possibles := OrderedCollection new.
	self
		allMorphsDo: [:pane | (pane isKindOf: PluggableListMorph)
				ifTrue: [_gsSqueakTemp_possibles add: pane]].
	getSelectors
		do: [:sel | 
			| aPane |
			aPane := _gsSqueakTemp_possibles
						detect: [:pane | pane getListSelector == sel]
						ifNone: [].
			aPane
				ifNil: [Transcript cr; show: 'Warning: pane ' , sel , ' not found.']
				ifNotNil: [_gsSqueakTemp_aList add: aPane]].
	updatablePanes := _gsSqueakTemp_aList asArray