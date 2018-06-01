release
myPlayerClasses
	"Answer all my (non-systemDefined) player classes"
	| classes presenter |
	classes := Set new.
	presenter := self world presenter.
	presenter ifNotNil: [
		presenter flushPlayerListCache.		"old and outside guys"
		presenter allExtantPlayers do:
			[:p | p class isSystemDefined ifFalse: [classes add: p class]]].
	^classes