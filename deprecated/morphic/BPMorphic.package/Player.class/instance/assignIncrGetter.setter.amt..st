slots-assignment
assignIncrGetter: getterSelector setter: setterSelector amt: anIncrement 
	self perform: setterSelector with: (self perform: getterSelector)
			+ anIncrement