blocks and conditionals
statementListAsExpression
	"The #BAR and #BAZ statement list should generate statements separated by
	comma rather than terminated by semicolon."
	^#FOO
	  	and: [
			#BAR.
			#BAZ
		]