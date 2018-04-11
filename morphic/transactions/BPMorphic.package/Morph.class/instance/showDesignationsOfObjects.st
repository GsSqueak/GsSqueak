-Etoys-card in a stack
showDesignationsOfObjects
	"Momentarily show the designations of objects on the receiver"
	| _gsSqueakTemp_colorToUse |
	self isStackBackground
		ifFalse: [^ self].
	self
		submorphsDo: [:aMorph | 
			| aLabel |
			aLabel := aMorph renderedMorph holdsSeparateDataForEachInstance
						ifTrue: [_gsSqueakTemp_colorToUse := Color orange.
							aMorph externalName]
						ifFalse: [_gsSqueakTemp_colorToUse := aMorph isShared
										ifTrue: [Color green]
										ifFalse: [Color red].
							nil].
			Display
				border: (aMorph fullBoundsInWorld insetBy: -6)
				width: 6
				rule: Form over
				fillColor: _gsSqueakTemp_colorToUse.
			aLabel
				ifNotNil: [aLabel asString
						displayOn: Display
						at: aMorph fullBoundsInWorld bottomLeft + (0 @ 5)
						textColor: Color blue]].
	Sensor anyButtonPressed
		ifTrue: [Sensor waitNoButton]
		ifFalse: [Sensor waitButton].
	World fullRepaintNeeded