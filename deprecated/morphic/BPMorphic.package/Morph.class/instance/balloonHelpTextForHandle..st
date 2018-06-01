halos and balloon help
balloonHelpTextForHandle: aHandle 
	"Answer a string providing balloon help for the
	given halo handle"
	| itsSelector |
	itsSelector := aHandle eventHandler firstMouseSelector.
	itsSelector == #doRecolor:with:
		ifTrue: [^ Preferences propertySheetFromHalo
				ifTrue: ['Open a property sheet.']
				ifFalse: ['Change color']].
	itsSelector == #mouseDownInDimissHandle:with:
		ifTrue: [^ TrashCanMorph preserveTrash
				ifTrue: ['Move to trash']
				ifFalse: ['Remove from screen']].
	#(#(#addFullHandles 'More halo handles' ) #(#addSimpleHandles 'Fewer halo handles' ) #(#chooseEmphasisOrAlignment 'Emphasis & alignment' ) #(#chooseFont 'Change font' ) #(#chooseNewGraphicFromHalo 'Choose a new graphic' ) #(#chooseStyle 'Change style' ) #(#dismiss 'Remove' ) #(#doDebug:with: 'Debug' ) #(#doDirection:with: 'Choose forward direction' ) #(#doDup:with: 'Duplicate' ) #(#doMakeSibling:with: 'Make a sibling' ) #(#doMenu:with: 'Menu' ) #(#doGrab:with: 'Pick up' ) #(#editButtonsScript 'See the script for this button' ) #(#editDrawing 'Repaint' ) #(#doDupOrMakeSibling:with: 'Duplicate (press shift to make a sibling)' ) #(#doMakeSiblingOrDup:with: 'Make a sibling (press shift to make simple duplicate)' ) #(#makeNascentScript 'Make a scratch script' ) #(#makeNewDrawingWithin 'Paint new object' ) #(#mouseDownInCollapseHandle:with: 'Collapse' ) #(#mouseDownOnHelpHandle: 'Help' ) #(#openViewerForArgument 'Open a Viewer for me. Press shift for a snapshot.' ) #(#openViewerForTarget:with: 'Open a Viewer for me. Press shift for a snapshot.' ) #(#paintBackground 'Paint background' ) #(#prepareToTrackCenterOfRotation:with: 'Move object or set center of rotation' ) #(#presentViewMenu 'Present the Viewing menu' ) #(#startDrag:with: 'Move' ) #(#startGrow:with: 'Change size' ) #(#startRot:with: 'Rotate' ) #(#startScale:with: 'Change scale' ) #(#tearOffTile 'Make a tile representing this object' ) #(#tearOffTileForTarget:with: 'Make a tile representing this object' ) #(#trackCenterOfRotation:with: 'Set center of rotation' ) )
		do: [:pair | itsSelector == pair first
				ifTrue: [^ pair last]].
	^ 'unknown halo handle' translated