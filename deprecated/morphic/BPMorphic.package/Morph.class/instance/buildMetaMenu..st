meta-actions
buildMetaMenu: evt 
	"Build the morph menu. This menu has two sections. The first section
	contains commands that are handled by the hand; the second
	contains commands handled by the argument morph."
	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu addStayUpItem.
	menu add: 'grab' translated action: #grabMorph:.
	menu add: 'copy to paste buffer' translated action: #copyToPasteBuffer:.
	self maybeAddCollapseItemTo: menu.
	menu add: 'delete' translated action: #dismissMorph:.
	menu addLine.
	menu add: 'copy text' translated action: #clipText.
	menu add: 'copy Postscript' translated action: #clipPostscript.
	menu add: 'print Postscript to file...' translated action: #printPSToFile.
	menu addLine.
	menu add: 'go behind' translated action: #goBehind.
	menu add: 'add halo' translated action: #addHalo:.
	menu add: 'duplicate' translated action: #maybeDuplicateMorph:.
	self addEmbeddingMenuItemsTo: menu hand: evt hand.
	menu add: 'resize' translated action: #resizeMorph:.
	"Give the argument control over what should be done about fill styles"
	self addFillStyleMenuItems: menu hand: evt hand.
	self addDropShadowMenuItems: menu hand: evt hand.
	self addLayoutMenuItems: menu hand: evt hand.
	menu
		addUpdating: #hasClipSubmorphsString
		target: self
		selector: #changeClipSubmorphs
		argumentList: #().
	menu addLine.
	(self morphsAt: evt position) size > 1
		ifTrue: [menu
				add: 'submorphs...' translated
				target: self
				selector: #invokeMetaMenuAt:event:
				argument: evt position].
	menu addLine.
	menu
		add: 'inspect' translated
		selector: #inspectAt:event:
		argument: evt position.
	menu add: 'explore' translated action: #explore.
	menu add: 'browse hierarchy' translated action: #browseHierarchy.
	menu add: 'make own subclass' translated action: #subclassMorph.
	menu addLine.
	self isMorphicModel
		ifTrue: [menu add: 'save morph as prototype' translated action: #saveAsPrototype.
			self ~~ self world modelOrNil
				ifTrue: [menu add: 'become this world''s model' translated action: #beThisWorldsModel]].
	menu add: 'save morph in file' translated action: #saveOnFile.
	(self hasProperty: #resourceFilePath)
		ifTrue: [((self valueOfProperty: #resourceFilePath)
					endsWith: '.morph')
				ifTrue: [menu add: 'save as resource' translated action: #saveAsResource].
			menu add: 'update from resource' translated action: #updateFromResource]
		ifFalse: [menu add: 'attach to resource' translated action: #attachToResource].
	menu add: 'show actions' translated action: #showActions.
	menu addLine.
	self addDebuggingItemsTo: menu hand: evt hand.
	self addCustomMenuItems: menu hand: evt hand.
	^ menu