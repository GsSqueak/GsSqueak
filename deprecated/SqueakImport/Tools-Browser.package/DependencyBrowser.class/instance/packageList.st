package list
packageList
	"The base list of packages in the system"
	^packageList ifNil:[packageList := (PackageInfo allPackages collect: [ :each | each packageName]) sort]