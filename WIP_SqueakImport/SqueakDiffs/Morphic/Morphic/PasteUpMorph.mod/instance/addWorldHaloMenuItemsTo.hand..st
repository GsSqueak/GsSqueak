menu & halo
addWorldHaloMenuItemsTo: aMenu hand: aHandMorph
	"Add standard halo items to the menu, given that the receiver is a World"

	| unlockables |
	self addFillStyleMenuItems: aMenu hand: aHandMorph.
	self addLayoutMenuItems: aMenu hand: aHandMorph.

	aMenu addLine.
	self addWorldToggleItemsToHaloMenu: aMenu.
	aMenu addLine.
	self addCopyItemsTo: aMenu.
	self addPlayerItemsTo: aMenu.
	self addExportMenuItems: aMenu hand: aHandMorph.
	self addStackItemsTo: aMenu.
	self addMiscExtrasTo: aMenu.

	Preferences noviceMode ifFalse:
		[self addDebuggingItemsTo: aMenu hand: aHandMorph].

	aMenu addLine.
	aMenu defaultTarget: self.

	aMenu addLine.

	unlockables := self submorphs select:
		[:m | m isLocked].
	unlockables size = 1 ifTrue:
		[aMenu add: ('unlock "{1}"' translated format:{unlockables first externalName})action: #unlockContents].
	unlockables size > 1 ifTrue:
		[aMenu add: 'unlock all contents' translated action: #unlockContents.
		aMenu add: 'unlock...' translated action: #unlockOneSubpart].

	aMenu defaultTarget: aHandMorph.
