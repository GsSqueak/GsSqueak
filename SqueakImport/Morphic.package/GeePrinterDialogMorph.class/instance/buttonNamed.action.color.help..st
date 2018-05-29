as yet unclassified
buttonNamed: aString action: aSymbol color: aColor help: helpString 
	| f col |
	f := SimpleButtonMorph new target: self;
				 label: aString;
				 color: aColor;
				 borderColor: aColor muchDarker;
				 actionSelector: aSymbol;
				 setBalloonText: helpString.
	col := self inAColumn: {f}.
	col hResizing: #shrinkWrap.
	^ col