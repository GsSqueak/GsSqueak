accessing
environment

	^ environment 	ifNil: [environment := self interface defaultEnvironment]