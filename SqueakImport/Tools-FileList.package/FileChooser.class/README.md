This class provides a simple "modal" dialog box to choose a file, with a directory tree, a file list, and open and cancel buttons. It is meant to be an improvement of FileList2 modalFileSelector. 

An applictaion can customize the user interface in a straightforward way. Creation of the file choser is done in several steps by calling various helper methods.. 

The order of the method calls when creating a customized file chooser are important. The UI must be created before methods that change the attributes of the UI can be called. You can either start by creating the default UI, and them modify the morphs in the file chooser (there are methods to access the buttons and the panes).

You can also build a completely custom UI, by writing your own methods for creating the layout etc. One way to do this is to subclass FileChooser and override the methods you want to change, andother way is to supply your own morphic view to the file chooser. This must be an instance of MorphicModel or a subclass of it, because the file chooser uses the model functionality.

There are two varieties of the UI, one that is supposed to be like a dialog box (uses colors from the menu preferences in class Preference), and one is using a system window. The way a system window works turns out to be somehat different from how a plain Morphic Model works, and this is why there are separate methods for creating the dialog box UI and the system window UI.

On the class side, there are examples that shows differents ways to use this class.

On the to do list is adding support for a file save dialog box, with a directory tree and a text input field for typing a file name.

(Mikael Kindborg, 050815)
