fileIn/Out
chooseSubjectPrefixForEmail

	| subjectIndex |

	subjectIndex :=
		(UIManager default chooseFrom: #('Bug fix [FIX]' 'Enhancement [ENH]' 'Goodie [GOODIE]' 'Test suite [TEST]' 'None of the above (will not be archived)')
			title: 'What type of change set\are you submitting to the list?' withCRs).

	^ #('[CS] ' '[FIX] ' '[ENH] ' '[GOODIE] ' '[TEST] ' '[CS] ') at: subjectIndex + 1