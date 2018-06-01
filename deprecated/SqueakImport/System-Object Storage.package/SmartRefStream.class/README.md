Ordinary ReferenceStreams assume that the names and order of instance variables is exactly the same when an object file is written and read.  
	SmartRefStream allows object files to be read even after instance variables have changed or the entire class has been renamed.

When an object file is written, no one knows how the classes will change in the future.  Therefore, all conversion must be done when the file is read.  The key is to store enough information in the file about the names of the instance variables of all outgoing classes.  

SmartRefStream works best with only one tree of objects per file.  You can nextPut: more than once, but each object tree gets its own class structure description, which is big.  

Conversion of old objects is done by a method in each class called (convertToCurrentVersion: varDict refStream: smartRefStrm).  At fileOut time, ChangeSet>>checkForConversionMethods creates a prototype of this method (if Preference #conversionMethodsAtFileOut is true).  The programmer must edit this method to 
    (1) test if the incoming object needs conversion, 
    (2) put non-nil values into any new inst vars that need them, and 
    (3) save the data of any inst vars that are being deleted. 

Determining which old version is represented by the incoming object can be done in several ways: 
- noticing that a current inst var is nil when it should have data, 
- noticing that there is an older inst var name in the variable dictionary (varDict), 
- checking kinds of objects in one or more inst vars, or 
- retrieving the classVersion of the incoming object from the ref stream.  

If a class is renamed, a method goes into SmartRefStream telling the new name.  

The conversion method of the new class must be prepared to accept instances of the old class also.  If no inst var names have changed, the conversion method does nothing.




An example:  
    Suppose we change the representation of class Rectangle from ('origin' 'corner') to ('origin' 'extent').  Suppose lots of Rectangle instances are already out on files (in .pr project files, especially).  

    The programmer changes the class definition, modifies all the methods, and filesOut.  A series of dialogs appear, asking if instances Rectangle might be in an object file, if 'extent' needs to be non-nil (yes), and if the info in 'corner' needs to be preserved (yes).  This method appears:

Rectangle >> convertToCurrentVersion: varDict refStream: smartRefStrm
	"These variables are automatically stored into the new instance: #('origin').
	Test for this particular conversion.  Get values using expressions like (varDict at: 'foo')."

	"New variables: #('extent').  If a non-nil value is needed, please assign it."
	"These are going away #('corner').  Possibly store their info in some other variable?"
	"Move your code above the ^ super...  Delete extra comments."
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm

The programmer modifies it to be:

Rectangle >> convertToCurrentVersion: varDict refStream: smartRefStrm

(varDict includesKey: 'extent') ifFalse: ["old version!"
	"Create the new extent, and preserve the info from the old corner"
	extent := (varDict at: 'corner') - origin.
	].
^ super convertToCurrentVersion: varDict refStream: smartRefStrm

	This conversion method stays in the system and is ready to convert the old format of Rectangle whenever one is encountered in an object file.  Note that the subclasses of Rectangle, (B3DViewport, CharacterBlock, and Quadrangle) do not need conversion methods.  Their instances will be converted by the code in Rectangle.  


	Files written by SmartRefStream are in standard fileout format.  You can mix raw objects with code to be filed in.  The file starts out in the normal fileOut format.  Definitions of new classes on the front.

structures 	Dictionary of (#Rectangle -> #(<classVersionInteger> 'origin' 'corner')).  Inst 
				var names are strings.
steady 		Set of Classes who have the same structure now as on the incoming file.
				Includes classes with same inst vars except for new ones added on the end.
reshaped 	Dictionary of Classes who have a different structure now from the incoming file.  
				Includes those with same inst vars but new version number.
				(old class name -> method selector to fill in data for version to version)
renamed	Dictionary of Classes who have a different name.  Make an instance of the new
			class, and send it the conversion call.
				(old class name symbol -> new class name).  
renamedConv	Dictionary of conversion selector for Classes who have a different name.
				(old class name symbol -> conversion selector).  
topCall		Tells if next or nextPut: are working on the top object in the tree.  
			nil if outside, the top object if deep inside.

See DataStream.typeIDFor: for where the tangle of objects is clipped, so the whole system will not be written on the file.

No object that is written on the file is ever a class.  All class definitions are filed in.  A class may be stored inside an ImageSegment that itself is stored in a SmartRefStream.




UniClasses are classes for the instance specific behavior of just one instance.  Subclasses of Player are an example.  When a UniClass is read in, and a class of the same name already exists, the incoming one is renamed.  ObjectScanner converts the filed-in code.

Values in instance variables of UniClasses are stored in the array that tells the class structure.  It is the fourth of the four top level objects.  #(version (class-structure) the-object ((#Player25 scripts slotInfo costumeDictionary) (#Player26 scripts slotInfo costumeDictionary))).

There is a separate subclass for doing veryDeepCopy (in memory).  Currently, any object for which objectToStoreOnDataStream return an object other than self, does this:  The new object (a DiskProxy) is traced.  When it comes time to go through the fields of the old object, they are not found as keys in references (DiskProxies are there instead).  So the old field value is left in the new object.  That is OK for StrikeFont, Class, MetaClass, DisplayScreen.  But the DiskProxies are evaluated, which takes a lot of time.

Some metaclasses are put into the structures table.  This is for when a block has a receiver that is a class.  See checkFatalReshape:.

ImageSegments:
	A ReferenceStream is used to enumerate objects to put inside an ImageSegment.  If an instance of a UniClass is seen, the class is put in also.
	A SmartRefStream is used to store the ImageSegment.  Roots are nil, and the segment is a wordArray.  We are encoding the outPointers.  Structures contains all classes from both places.  Must filter out UniClasses for some things, and do include them for putting source code at end of file.  Do not write any class inst vars in file.


--Ted Kaehler and Bob Arning.



How are the selectors in the '*Morphic-conversion' protocol ending with something like

         ttfclpomsswfpp0

constructed and what does it mean?


Answer:
It is the initials of all instance variables followed by the class version integer. The initials allow to detect  most changes to the instance variables, but if this is not sufficient (perhaps because the new var had the same initial, or the vars did not change in name at all) we still have the class version.

Most classes are still at version 0, but if you check implementers of classVersion you can find a few that were incremented to force a conversion on load.