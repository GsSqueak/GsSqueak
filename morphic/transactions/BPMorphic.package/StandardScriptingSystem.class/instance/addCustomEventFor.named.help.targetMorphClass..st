-Etoys-customevents-custom events
addCustomEventFor: registrantClass named: aSymbol help: helpString targetMorphClass: targetClass 
	| _gsSqueakTemp_registration |
	_gsSqueakTemp_registration := self customEventsRegistry
				at: aSymbol
				ifAbsentPut: [IdentityDictionary new].
	_gsSqueakTemp_registration at: registrantClass put: {helpString. targetClass}