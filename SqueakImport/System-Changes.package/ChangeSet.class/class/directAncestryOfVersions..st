scanning
directAncestryOfVersions: changeRecords
	"Take a sequence of ChangeRecords as answered by scanVersionsOf:class:meta:category:selector:
	 and answer a filtered subsequence consisting only of direct ancestors.  For example, if the input is
		eem 7/7/2009 20:06	7 July 2009 8:06 pm
		eem 6/18/2009 19:21	18 June 2009 7:21 pm
		eem 5/5/2009 12:16	5 May 2009 12:16 pm
		eem 6/18/2009 19:19	18 June 2009 7:19 pm
		eem 6/18/2009 18:57	18 June 2009 6:57 pm
		eem 5/5/2009 12:16	5 May 2009 12:16 pm
		eem 6/18/2009 18:17	18 June 2009 6:17 pm
		eem 6/18/2009 18:14	18 June 2009 6:14 pm
		eem 6/18/2009 18:06	18 June 2009 6:06 pm
		eem 5/5/2009 12:16	5 May 2009 12:16 pm
		eem 5/4/2009 19:19	4 May 2009 7:19 pm
	the output should be
		eem 7/7/2009 20:06	7 July 2009 8:06 pm
		eem 6/18/2009 19:21	18 June 2009 7:21 pm
		eem 5/5/2009 12:16	5 May 2009 12:16 pm
		eem 5/4/2009 19:19	4 May 2009 7:19 pm"

	| filtered i last |
	filtered := OrderedCollection new.
	i := 1.
	[i <= changeRecords size] whileTrue:
		[filtered addLast: (changeRecords at: i).
		 last := changeRecords
					findLast: [:chgRec| filtered last stamp = chgRec stamp and: [filtered last position = chgRec position]]
					startingAt: i.
		 i := last = 0 ifTrue: [i + 1] ifFalse: [last + 1]].
	^filtered