instance creation
from: oldVersion to: newVersion

	^ (self diffTypeFrom: oldVersion to: newVersion) new
		setOldVersion: oldVersion newVersion: newVersion;
		yourself