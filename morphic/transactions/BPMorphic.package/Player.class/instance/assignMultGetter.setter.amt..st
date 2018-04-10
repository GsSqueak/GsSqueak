slots-assignment
assignMultGetter: getterSelector setter: setterSelector amt: aMultiplier 
	self perform: setterSelector with: (self perform: getterSelector)
			* aMultiplier