customevents-misc
noteDeletionOf: aMorph fromWorld: aWorld 
	"aMorph, while pointing to me as its costumee, has been deleted"
	"This may be too aggressive because deletion of a morph may not
	really mean deletion of its associated player -- in light of hoped-for
	multiple viewing"
	| _gsSqueakTemp_viewers _gsSqueakTemp_scriptors _gsSqueakTemp_viewerFlaps |
	_gsSqueakTemp_viewers := OrderedCollection new.
	_gsSqueakTemp_viewerFlaps := OrderedCollection new.
	_gsSqueakTemp_scriptors := OrderedCollection new.
	aWorld allMorphs
		do: [:m | 
			m isAViewer
				ifTrue: [_gsSqueakTemp_viewers add: m].
			((m isKindOf: ViewerFlapTab)
					and: [m scriptedPlayer == self])
				ifTrue: [_gsSqueakTemp_viewerFlaps add: m].
			((m isKindOf: ScriptEditorMorph)
					and: [m myMorph == aMorph])
				ifTrue: [_gsSqueakTemp_scriptors add: m]].
	aMorph removeAllEventTriggersFor: self.
	aWorld removeAllEventTriggersFor: self.
	_gsSqueakTemp_viewers
		do: [:v | v noteDeletionOf: aMorph].
	_gsSqueakTemp_viewerFlaps
		do: [:v | v dismissViaHalo].
	_gsSqueakTemp_scriptors
		do: [:s | s privateDelete]