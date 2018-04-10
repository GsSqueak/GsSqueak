visual properties
dimmedForm
	^ dimmedForm
		ifNil: [dimmedForm := self firstSubmorph baseGraphic dimmed]