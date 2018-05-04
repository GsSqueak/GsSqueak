*VMMaker-translation
uncheckedAbstractSelectors
	"Selectors for abstract methods that are not required to have concrete
	implementations in a code generator for this class. These may be methods
	in this class that send #subclassResponsibility, methods with implementations
	supplied directly by the code generator, or methods implemented in the support
	code. A code generator for translating this class in a browser should not raise
	warnings about missing implementations for these selectors."

	| codeGeneratorMethods |
	"methods with implementations provide by the code generator or platform sources and macros"
	codeGeneratorMethods := #(
			bytesPerWord.
			baseHeaderSize.
			byteAt:.
			anAbstractMethod	"for unit test"
		).
	"abstract methods in this class are presumed to have implementations in subclasses"
	^ codeGeneratorMethods,  self abstractSelectors