accessing
contents

	^ self object explorerContents
		do: [:wrapper | wrapper parent: self];
		yourself