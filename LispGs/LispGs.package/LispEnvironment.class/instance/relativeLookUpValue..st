experimental
relativeLookUpValue: aSymbol 
	| env denv |
	denv := 0.
	env := self.
	[env bindsSymbol: aSymbol]
		whileFalse: [denv := denv + 1.
			env := env parent.
			env
				ifNil: [self error: 'no binding found for ' , aSymbol]].
	^ env -> denv