write and read
writeClass: aClass
	"Write out a DiskProxy for the class.  It will look up the class's name in Smalltalk in the new sustem.  Never write classes or methodDictionaries as objects.  For novel classes, front part of file is a fileIn of the new class."

	"This method never executed because objectToStoreOnDataStream returns a DiskProxy.  See DataStream.nextPut:"
    ^ self error: 'Write a DiskProxy instead'