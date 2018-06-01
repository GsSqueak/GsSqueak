*VMMaker-translation
abstractSelectors
	"Selectors for abstract methods in this class"
	^ self selectors
		select: [:sel | (self compiledMethodAt: sel) requiresConcreteImplementation]