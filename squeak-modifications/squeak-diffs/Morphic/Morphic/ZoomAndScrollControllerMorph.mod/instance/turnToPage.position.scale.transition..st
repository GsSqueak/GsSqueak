as yet unclassified
turnToPage: page position: aPoint scale: aNumber transition: aSpec
 
	| myBook |

	target == page ifTrue: [^false].
	page ifNil: [^false].
	myBook := (self ownerThatIsA: StoryboardBookMorph) ifNil: [^ false].
	2 timesRepeat: [
		page
			cameraPoint: aPoint;
			changeScaleTo: aNumber
	].
	BookMorph turnOffSoundWhile: [
		myBook 
			goToPageMorph: page 
			transitionSpec: aSpec.
	].
	^true