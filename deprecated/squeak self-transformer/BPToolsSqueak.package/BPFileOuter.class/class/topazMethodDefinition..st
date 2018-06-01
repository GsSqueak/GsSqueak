as yet unclassified
topazMethodDefinition: aMethodSymbol
	| source |
	source := self transformedMethodSource: aMethodSymbol.
	
	^ '
set compile_env: 7

category: ''', 'test' ,'
method: ', self name, ' 
', source,'
%

set compile_env: 0
'