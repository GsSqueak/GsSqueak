*Morphic-Etoys-customevents-custom events
addCustomEventFor: registrantClass named: aSymbol help: helpString targetMorphClass: targetClass
	| registration |
	registration := self customEventsRegistry at: aSymbol ifAbsentPut: [ IdentityDictionary new ].
	registration at: registrantClass put: { helpString. targetClass }.
