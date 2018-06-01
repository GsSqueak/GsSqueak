url
isInWorld: aWorld withUrl: aUrl
	| urls bks short |
	"If a book with this url is in the that (current) world, return it.  Say if it is out or in another world."

	urls := OrderedCollection new.
	bks := OrderedCollection new.
	aWorld allMorphsDo: [:aBook | (aBook isKindOf: BookMorph) ifTrue: [
			bks add: aBook.
			 (urls add: (aBook valueOfProperty: #url)) = aUrl ifTrue: [
				aBook world == aWorld 
					ifTrue: [^ aBook]]]]. 	"shortcut"
		
	self withAllSubclassesDo: [:cls |
		cls allInstancesDo: [:aBook | 
			 (aBook valueOfProperty: #url) = aUrl ifTrue: [
				aBook world == aWorld 
					ifTrue: [^ aBook]
					ifFalse: [
						self inform: 'Book may be open in some other project' translated.
						^ aBook]]]].

	"if same book name, use it"
	short := (aUrl findTokens: '/') last.
	urls withIndexDo: [:kk :ind | (kk findTokens: '/') last = short ifTrue: [
			^ bks at: ind]].
	^ #out