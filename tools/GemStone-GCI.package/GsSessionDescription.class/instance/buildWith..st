toolbuilder
buildWith: builder

	| windowSpec windowElements |
	windowElements := self buildWindowElementsWith: builder.
	windowSpec := self buildWindowWith: builder specs: windowElements.
	windowSpec buttons: (self buildButtonsWith: builder).	
	^ builder build: windowSpec