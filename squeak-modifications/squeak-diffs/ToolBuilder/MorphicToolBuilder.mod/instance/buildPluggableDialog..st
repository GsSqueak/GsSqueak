widgets optional
buildPluggableDialog: aSpec

	| widget |

	widget := self dialogClass new.
	self register: widget id: aSpec name.
	
	widget model: aSpec model.

	"Set child dependent layout properties. The pane morph holds the special contents."
	widget paneMorph wantsPaneSplitters: (aSpec wantsResizeHandles ifNil: [true]).
	self setLayoutHintsFor: widget paneMorph spec: aSpec.
	widget paneMorph layoutInset: (aSpec padding ifNil: [ProportionalSplitterMorph gripThickness]).
	widget paneMorph cellInset: (aSpec spacing ifNil: [ProportionalSplitterMorph gripThickness]).
	widget paneMorph wantsPaneSplitters ifTrue: [
		widget paneMorph addCornerGrips"addEdgeGrips".
		widget paneMorph grips do: [:ea | ea drawCornerResizeHandles: true]].

	"Now create the children."
	panes := OrderedCollection new.
	aSpec children isSymbol
		ifTrue: [
			widget getChildrenSelector: aSpec children.
			widget update: aSpec children]
		ifFalse: [
			self buildAll: aSpec children in: widget paneMorph].

	"Now create the buttons."
	aSpec buttons isSymbol
		ifTrue: [
			widget getButtonsSelector: aSpec buttons.
			widget update: aSpec buttons]
		ifFalse: [
			self buildAll: aSpec buttons in: widget buttonRowMorph.
			widget updateButtonProperties].

	aSpec title ifNotNil: [:label |
		label isSymbol 
			ifTrue:[widget getTitleSelector: label; update: label]
			ifFalse:[widget title: label]].
	aSpec message ifNotNil: [:label |
		label isSymbol 
			ifTrue:[widget getMessageSelector: label; update: label]
			ifFalse:[widget message: label]].
	
	"Interaction behavior."
	aSpec autoCancel ifNotNil: [:b | widget autoCancel: b].
	aSpec exclusive ifNotNil: [:b | widget exclusive: b].
		
	widget closeDialogSelector: aSpec closeAction.
	self buildHelpFor: widget spec: aSpec. 

	"Everything is shrink-wrapped around the pane morph."
	widget paneMorph extent: (aSpec extent ifNil:[widget initialExtent]).

	^ widget