accessing
name

	^name ifNil: [ self hash asString forceTo: 5 paddingStartWith: $ ]