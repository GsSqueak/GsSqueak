menu commands
toggleAnnotationPaneSize
	| _gsSqueakTemp_handle _gsSqueakTemp_origin _gsSqueakTemp_aHand _gsSqueakTemp_siblings |
	self flag: #bob.
	"CRUDE HACK to enable changing the size of the annotations pane"
	owner
		ifNil: [^ self].
	_gsSqueakTemp_siblings := owner submorphs.
	_gsSqueakTemp_siblings size > 3
		ifTrue: [^ self].
	_gsSqueakTemp_siblings size < 2
		ifTrue: [^ self].
	_gsSqueakTemp_aHand := self primaryHand.
	_gsSqueakTemp_origin := _gsSqueakTemp_aHand position.
	(_gsSqueakTemp_handle := HandleMorph new)
		forEachPointDo: [:newPoint | 
			| lf ht prevBottom newHeight m |
			_gsSqueakTemp_handle removeAllMorphs.
			newHeight := (newPoint - _gsSqueakTemp_origin) y asInteger min: owner height - 50 max: 16.
			lf := _gsSqueakTemp_siblings last layoutFrame.
			lf bottomOffset: newHeight.
			prevBottom := newHeight.
			_gsSqueakTemp_siblings size - 1
				to: 1
				by: -1
				do: [:index | 
					m := _gsSqueakTemp_siblings at: index.
					lf := m layoutFrame.
					ht := lf bottomOffset - lf topOffset.
					lf topOffset: prevBottom.
					lf bottomOffset = 0
						ifFalse: [lf bottomOffset: prevBottom + ht].
					prevBottom := prevBottom + ht].
			owner layoutChanged]
		lastPointDo: [:newPoint | 
			_gsSqueakTemp_handle deleteBalloon.
			self halo
				ifNotNil: [:halo | halo addHandles]].
	_gsSqueakTemp_aHand attachMorph: _gsSqueakTemp_handle.
	_gsSqueakTemp_handle setProperty: #helpAtCenter toValue: true.
	_gsSqueakTemp_handle showBalloon: 'Move cursor farther from
this point to increase pane.
Click when done.' hand: _gsSqueakTemp_aHand.
	_gsSqueakTemp_handle startStepping