interpreter shell
isIntegerValue: valueWord 
	^ valueWord >= 16r-40000000 and: [valueWord <= 16r3FFFFFFF]