misc
offerViewerMenuFor: aViewer event: evt 
	"Put up the Viewer menu on behalf of the receiver. If the shift key is
	held down, put up the alternate menu. The menu omits the 'add a
	new variable' item when in eToyFriendly mode, as per request from
	teachers using Squeakland in 2003 once the button for adding a new
	variable was added to the viewer"
	| _gsSqueakTemp_aMenu _gsSqueakTemp_aWorld |
	(evt notNil
			and: [evt shiftPressed
					and: [Preferences eToyFriendly not]])
		ifTrue: [^ self offerAlternateViewerMenuFor: aViewer event: evt].
	_gsSqueakTemp_aWorld := aViewer world.
	_gsSqueakTemp_aMenu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_aMenu title: self externalName.
	_gsSqueakTemp_aMenu addStayUpItem.
	self costume renderedMorph offerCostumeViewerMenu: _gsSqueakTemp_aMenu.
	Preferences eToyFriendly
		ifFalse: ["exclude this from squeakland-like UI"
			_gsSqueakTemp_aMenu
				add: 'add a new variable' translated
				target: self
				action: #addInstanceVariable.
			_gsSqueakTemp_aMenu balloonTextForLastItem: 'Add a new variable to this object and all of its siblings.  You will be asked to supply a name for it.' translated].
	_gsSqueakTemp_aMenu
		add: 'add a new script' translated
		target: aViewer
		action: #newPermanentScript.
	_gsSqueakTemp_aMenu balloonTextForLastItem: 'Add a new script that will work for this object and all of its siblings' translated.
	_gsSqueakTemp_aMenu addLine.
	self hasCostumeThatIsAWorld
		ifFalse: [_gsSqueakTemp_aMenu
				add: 'grab me' translated
				target: self
				selector: #grabPlayerIn:
				argument: _gsSqueakTemp_aWorld.
			_gsSqueakTemp_aMenu balloonTextForLastItem: 'This will actually pick up the object this Viewer is looking at, and hand it to you.  Click the (left) button to drop it' translated].
	_gsSqueakTemp_aMenu
		add: 'reveal me' translated
		target: self
		selector: #revealPlayerIn:
		argument: _gsSqueakTemp_aWorld.
	_gsSqueakTemp_aMenu balloonTextForLastItem: 'If you have misplaced the object that this Viewer is looking at, use this item to (try to) make it visible' translated.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu add: 'tile representing me' translated action: #tearOffTileForSelf.
	_gsSqueakTemp_aMenu
		add: 'add search pane' translated
		target: aViewer
		action: #addSearchPane.
	Preferences eToyFriendly
		ifFalse: [_gsSqueakTemp_aMenu addLine.
			_gsSqueakTemp_aMenu
				add: 'more...' translated
				target: self
				selector: #offerAlternateViewerMenuFor:event:
				argumentList: {aViewer. evt}].
	_gsSqueakTemp_aMenu popUpEvent: evt in: _gsSqueakTemp_aWorld