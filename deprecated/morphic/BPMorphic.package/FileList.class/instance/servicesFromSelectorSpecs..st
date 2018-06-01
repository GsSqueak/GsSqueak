own services
servicesFromSelectorSpecs: symbolArray 
	"Answer an array of services represented by the incoming symbols,
	eliminating any that do not have a currently-registered service. Pass
	the symbol #- along unchanged to serve as a separator between
	services "
	"FileList new servicesFromSelectorSpecs: #(fileIn:
	fileIntoNewChangeSet: browseChangesFile:)"
	| _gsSqueakTemp_services _gsSqueakTemp_col |
	_gsSqueakTemp_col := OrderedCollection new.
	_gsSqueakTemp_services := self class allRegisteredServices
				, (self myServicesForFile: #dummy suffix: '*').
	symbolArray
		do: [:sel | | res | sel == #-
				ifTrue: [_gsSqueakTemp_col add: sel]
				ifFalse: [res := _gsSqueakTemp_services
								detect: [:each | each selector = sel]
								ifNone: [].
					res notNil
						ifTrue: [_gsSqueakTemp_col add: res]]].
	^ _gsSqueakTemp_col