interface
menuGet: aMenu shifted: shifted
	
	aMenu addList: {
		{'find...(f)' translated.		#find}.
		{'find selection again (g)' translated.		#findAgain}.
			#-.
		{'accept (s)' translated. #accept}.
		{'send message' translated.  #submit}}.

	^aMenu.