translation
uncheckedAbstractSelectors
	"Selectors for abstract methods that are not required to have concrete
	implementations in a code generator for this class. These may be methods
	in this class that send #subclassResponsibility, methods with implementations
	supplied directly by the code generator, or methods implemented in the support
	code. A code generator for translating this class in a browser should not raise
	warnings about missing implementations for these selectors."

	^super uncheckedAbstractSelectors, StackInterpreterPrimitives selectors