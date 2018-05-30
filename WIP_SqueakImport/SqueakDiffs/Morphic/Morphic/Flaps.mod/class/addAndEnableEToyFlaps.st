predefined flaps
addAndEnableEToyFlaps
	"Initialize the standard default out-of-box set of global flaps.  This method creates them and places them in my class variable #SharedFlapTabs, but does not itself get them displayed."

	| aSuppliesFlap |
	SharedFlapTabs
		ifNotNil: [^ self].
	SharedFlapTabs := OrderedCollection new.

	aSuppliesFlap := self newSuppliesFlapFromQuads: self quadsDefiningPlugInSuppliesFlap positioning: #right.
	aSuppliesFlap referent setNameTo: 'Supplies Flap' translated.  "Per request from Kim Rose, 7/19/02"
	SharedFlapTabs add: aSuppliesFlap.  "The #center designation doesn't quite work at the moment"

	(Smalltalk globals at: #SugarNavigatorBar ifPresent: [:c | c showSugarNavigator] ifAbsent: [false])
		ifTrue: [SharedFlapTabs add: self newSugarNavigatorFlap]
		ifFalse: [Preferences showProjectNavigator
			ifTrue:[ SharedFlapTabs add: self newNavigatorFlap]].

	self enableGlobalFlapWithID: 'Supplies' translated.

	(Smalltalk globals at: #SugarNavigatorBar ifPresent: [:c | c showSugarNavigator] ifAbsent: [false])
		ifTrue:
			[self enableGlobalFlapWithID: 'Sugar Navigator Flap' translated.
			(self globalFlapTabWithID: 'Sugar Navigator Flap' translated) ifNotNil:
				[:navTab | aSuppliesFlap sugarNavTab: navTab]]
		ifFalse: [
			Preferences showProjectNavigator
				ifTrue:[ self enableGlobalFlapWithID: 'Navigator' translated]].

	SharedFlapsAllowed := true.
	Project current flapsSuppressed: false.
	^ SharedFlapTabs

"Flaps addAndEnableEToyFlaps"