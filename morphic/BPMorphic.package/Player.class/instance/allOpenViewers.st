misc
allOpenViewers
	"Answer a list of all the viewers open on the receiver. Include viewers
	in closed flaps"
	| _gsSqueakTemp_aWorld _gsSqueakTemp_all |
	(_gsSqueakTemp_aWorld := self costume world)
		ifNil: [^ #()].
	_gsSqueakTemp_all := _gsSqueakTemp_aWorld allMorphs.
	_gsSqueakTemp_aWorld closedViewerFlapTabs
		do: [:aTab | _gsSqueakTemp_all addAll: aTab referent allMorphs].
	^ _gsSqueakTemp_all
		select: [:m | m isStandardViewer
				and: [m scriptedPlayer == self]]