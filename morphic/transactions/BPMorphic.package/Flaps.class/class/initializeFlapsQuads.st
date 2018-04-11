flaps registry
initializeFlapsQuads
	"initialize the list of dynamic flaps quads.
	self initializeFlapsQuads"
	FlapsQuads := nil.
	self registeredFlapsQuads at: 'PlugIn Supplies' put: self defaultsQuadsDefiningPlugInSuppliesFlap;
		 at: 'Stack Tools' put: self defaultsQuadsDefiningStackToolsFlap;
		 at: 'Supplies' put: self defaultsQuadsDefiningSuppliesFlap;
		 at: 'Tools' put: self defaultsQuadsDefiningToolsFlap;
		 at: 'Widgets' put: self defaultsQuadsDefiningWidgetsFlap.
	^ self registeredFlapsQuads