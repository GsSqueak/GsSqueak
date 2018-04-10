-Etoys-card in a stack
assuredCardPlayer
	"Answer the receiver's player, creating a new one if none currently
	exists "
	| _gsSqueakTemp_aPlayer |
	(_gsSqueakTemp_aPlayer := self player)
		ifNotNil: [(_gsSqueakTemp_aPlayer isKindOf: CardPlayer)
				ifTrue: [^ _gsSqueakTemp_aPlayer]
				ifFalse: [self error: 'Must convert to a CardPlayer'
					"later convert using as: and remove the error"]].
	self assureExternalName.
	"a default may be given if not named yet"
	self player: (_gsSqueakTemp_aPlayer := UnscriptedCardPlayer newUserInstance).
	"Force it to be a CardPlayer. Morph class no longer dictates what kind
	of player"
	_gsSqueakTemp_aPlayer costume: self.
	self presenter
		ifNotNil: [self presenter flushPlayerListCache].
	^ _gsSqueakTemp_aPlayer