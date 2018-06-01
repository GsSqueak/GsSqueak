slots-assignment
assignDecrGetter: getterSelector setter: setterSelector amt: aDecrement 
	self perform: setterSelector with: (self perform: getterSelector)
			- aDecrement