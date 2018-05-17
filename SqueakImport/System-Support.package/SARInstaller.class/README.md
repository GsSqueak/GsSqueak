I am an object that handles the loading of SAR (Squeak ARchive) files.

A SAR file is a Zip file that follows certain simple conventions:

* it may have a member named "install/preamble".

This member, if present, will be filed in as Smalltalk source code at the beginning of installation.
Typically, the code in the preamble will make whatever installation preparations are necessary,
and will then call methods in the "client services" method category to extract or install other zip members.

* It may have a member named "install/postscript".

This member, if present, will be filed in as Smalltalk source code at the end of installation.
Typically, the code in the postscript will set up the operating environment,
and will perhaps put objects in flaps, open projects or README files, or launch samples.

Within the code in the preamble and postscript, "self" is set to the instance of the SARInstaller.

If neither an "install/preamble" nor an "install/postscript" file is present,
all the members will be installed after prompting the user,
based on a best guess of the member file types that is based on member filename extensions.

This is new behavior.