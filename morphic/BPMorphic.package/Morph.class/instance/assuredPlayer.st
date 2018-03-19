-Etoys
assuredPlayer
	"Answer the receiver's player, creating a new one if none currently
	exists "
	| _gsSqueakTemp_aPlayer |
	(_gsSqueakTemp_aPlayer := self player)
		ifNil: [self assureExternalName.
			"a default may be given if not named yet"
			self player: (_gsSqueakTemp_aPlayer := self newPlayerInstance).
			"Different morphs may demand different player types"
			_gsSqueakTemp_aPlayer costume: self.
			self presenter
				ifNotNil: [self presenter flushPlayerListCache]].
	^ _gsSqueakTemp_aPlayer