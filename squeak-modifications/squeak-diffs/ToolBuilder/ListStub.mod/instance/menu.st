simulating
menu
	^ MenuStub fromSpec:
		(self model 
			perform: spec menu 
			with: (PluggableMenuSpec withModel: self model))