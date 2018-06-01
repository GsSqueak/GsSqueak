predefined flaps
addAndEnableEToyFlaps
	"Initialize the standard default out-of-box set of global flaps. This
	method creates them and places them in my class variable
	#SharedFlapTabs, but does not itself get them displayed."
	| _gsSqueakTemp_aSuppliesFlap |
	SharedFlapTabs
		ifNotNil: [^ self].
	SharedFlapTabs := OrderedCollection new.
	_gsSqueakTemp_aSuppliesFlap := self newSuppliesFlapFromQuads: self quadsDefiningPlugInSuppliesFlap positioning: #right.
	_gsSqueakTemp_aSuppliesFlap referent setNameTo: 'Supplies Flap' translated.
	"Per request from Kim Rose, 7/19/02"
	SharedFlapTabs add: _gsSqueakTemp_aSuppliesFlap.
	"The #center designation doesn't quite work at the moment"
	Preferences showProjectNavigator
		ifTrue: [SharedFlapTabs add: self newNavigatorFlap].
	self enableGlobalFlapWithID: 'Supplies' translated.
	Preferences showProjectNavigator
		ifTrue: [self enableGlobalFlapWithID: 'Navigator' translated].
	SharedFlapsAllowed := true.
	Project current flapsSuppressed: false.
	^ SharedFlapTabs"Flaps addAndEnableEToyFlaps"