reading
processNextTag

	| tag htmlEscape lookForNewTag lookForHtmlEscape tagFound valid inComment inTagString |
	lookForNewTag := true.
	lookForHtmlEscape := false.
	tagFound := false.
	tag := OrderedCollection new.
	htmlEscape := OrderedCollection new.
	inComment := false.
	inTagString := false.
	
	[stream atEnd not and: [tagFound not]] whileTrue: [
		| character |
		character := stream next.
		valid := (#(10 13) includes: character asciiValue) not.
		count := count + 1.
	
		character = $< ifTrue: [lookForNewTag := false].
		character = $& ifTrue: [inComment ifFalse: [lookForHtmlEscape := true]].
		
		lookForNewTag
			ifTrue: [
				lookForHtmlEscape
					ifFalse: [
						(valid or: [self breakLines not])
							ifTrue: [string add: character]
							ifFalse: [offset := offset + 1]]
					ifTrue: [valid ifTrue: [htmlEscape add: character]. offset := offset + 1]]
			ifFalse: [valid ifTrue: [tag add: character]. offset := offset + 1].

		"Toggle within tag string/text."
		(character = $" and: [lookForNewTag not])
			ifTrue: [inTagString := inTagString not].
		
		inComment := ((lookForNewTag not and: [tag size >= 4])
			and: [tag beginsWith: '<!--'])
			and: [(tag endsWith: '-->') not].

		(((character = $> and: [inComment not]) and: [lookForNewTag not]) and: [inTagString not]) ifTrue: [
			lookForNewTag := true.
			(tag beginsWith: '<!--')
				ifTrue: [self processComment: (String withAll: tag)]
				ifFalse: [tag second ~= $/
					ifTrue: [
						(tag atLast: 2) == $/
							ifTrue: [self processEmptyTag: (String withAll: tag)]
							ifFalse: [self processStartTag: (String withAll: tag)]]
					ifFalse: [self processEndTag: (String withAll: tag)]].			
			tagFound := true].

		(((character = $; and: [lookForNewTag])
			and: [htmlEscape notEmpty]) and: [htmlEscape first = $&]) ifTrue: [
				lookForHtmlEscape := false.
				self processHtmlEscape: (String withAll: htmlEscape).
				htmlEscape := OrderedCollection new]].
