editing
clickAt: clickPoint for: model controller: editor 
	"Give sensitive text a chance to fire. Display flash: (100@100 extent:
	100@100). "
	| _gsSqueakTemp_startBlock _gsSqueakTemp_action |
	_gsSqueakTemp_action := false.
	_gsSqueakTemp_startBlock := self characterBlockAtPoint: clickPoint.
	(text attributesAt: _gsSqueakTemp_startBlock stringIndex forStyle: textStyle)
		do: [:att | | range target box boxes | att mayActOnClick
				ifTrue: [(target := model)
						ifNil: [target := editor morph].
					range := text rangeOf: att startingAt: _gsSqueakTemp_startBlock stringIndex.
					boxes := self
								selectionRectsFrom: (self characterBlockForIndex: range first)
								to: (self characterBlockForIndex: range last + 1).
					box := boxes
								detect: [:each | each containsPoint: clickPoint]
								ifNone: [].
					box
						ifNotNil: [box := (editor transformFrom: nil)
										invertBoundsRect: box.
							editor morph
								allOwnersDo: [:m | box := box intersect: m boundsInWorld].
							self flag: #fix.
							"mt: Make it stateful and with real events."
							Utilities
								awaitMouseUpIn: box
								repeating: []
								ifSucceed: [(att
											actOnClickFor: target
											in: self
											at: clickPoint
											editor: editor)
										ifTrue: [_gsSqueakTemp_action := true]].
							Cursor currentCursor == Cursor webLink
								ifTrue: [Cursor normal show]]]].
	^ _gsSqueakTemp_action