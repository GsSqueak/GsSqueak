parsing topaz output
convertToMethodProxy: arrayOfLines inEnvironment: environmentProxy

	| inClass selector envId category |
	inClass := (self classProxyNamed: arrayOfLines first asSymbol 
						inEnvironment: environmentProxy).
	selector := arrayOfLines second asSymbol.
	envId := self convertToInteger: arrayOfLines third.
	category := arrayOfLines fourth asSymbol.
	^ GSGMethodProxy new
			inClass: inClass;
			selector: selector;
			envId: envId;
			category: category