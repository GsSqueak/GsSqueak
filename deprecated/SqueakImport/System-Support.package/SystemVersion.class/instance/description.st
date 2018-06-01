printing
description

	self isAlpha ifTrue: [^ 'ALPHA. New features which are not stable yet may come in\with each update. Also, existing features might not work reliably\due to updates and related changes.' translated withCRs].
	
	(self isFeatureFreeze and: [self isCodeFreeze not]) ifTrue: [^ 'FEATURE FREEZE. A new release is being prepared.\There will be only bugfixes, but no new features.' translated withCRs].
	
	self isCodeFreeze ifTrue: [^ 'RELEASE CANDIDATE. The new release is almost ready.\There will be only bugfixes, if any.' translated withCRs].
		
	self isRelease ifTrue: [^ ''].