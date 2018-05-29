instance creation
newFrom: aSessionDescription

	^ self new
		devkitPath: aSessionDescription devkitPath;
		stoneName: aSessionDescription stoneName;
		username: aSessionDescription username;
		password: aSessionDescription password;
		yourself