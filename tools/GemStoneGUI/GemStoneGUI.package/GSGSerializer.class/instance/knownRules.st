resolution
knownRules

	^ {#Boolean -> #Literal.
		#Number -> #Literal.
		#Integer -> #Literal.
		#Float -> #Literal.
		#String -> #Literal.
		#Symbol -> #Literal.
		#Nil -> #Literal} as: Dictionary