private
abandonResourcesThat: matchBlock
	"Private. Forget resources that match the given argument block"
	resourceMap keys "need copy" do:[:loc|
		(matchBlock value: loc) ifTrue:[
			resourceMap removeKey: loc ifAbsent:[].
			loaded remove: loc ifAbsent:[].
			unloaded remove: loc ifAbsent:[].
		].
	].