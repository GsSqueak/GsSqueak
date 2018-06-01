Extensions to FatBitsPaint

With the goal of making FatBitsPaint a fairly nifty Form fixer-upper in the Squeak/morphic environment, I have started this set of extensions. It will probably be updated as the mood strikes, so keep an eye out for new versions.

First, some basic operating instructions:

Get a Form and send it the message #morphEdit. To get started, you can try:

        (Form fromUser) morphEdit

And there is the form in all its glory. Control click on the form to get theFatBitsPaint menu and choose the "keep this menu up" item. This will be your main tool/command palette. With it you can:
¥ Change the magnification
¥ Change the brush size (in original scale pixels)
¥ Change the brush color (via a ColorPickerMorph)

Now to some of the enhancements:

(25 September 1999 2:38:25 pm )

¥ ColorPickerMorphs now have a label below that indicates their use (you might have more than one open)
¥ A quirk that could get the brush size out of alignment with the pixel size is fixed.
¥ A background has been added so that you can see the full extent of the Form and so that you can observe the effect of translucent pixels in the form.
¥ A menu item has been added to change the background color so that you can simulate the real environment the form will be displayed in.
¥ The magnification and brush size menus now highlight their current value.
¥ An inspect option has been added to the menu so that you can do arbitrary things to the form.
¥ A file out option has been added to write the form to a file.

(25 September 1999 10:02:13 pm ) 

¥ New menu item: Tools allows you to choose between (for now) Paint Brush (all there was before) and Selections. Selections allows you to select rectangular regions of the form where the next menu takes over.
¥ New menu item: Selections gives you choices:
        ¥ edit separately - opens a new editor on the selected rectangle. Useful for cropping.
        ¥ copy - copies the selection rectangle to a clipboard. Can be pasted to this or another FatBitsPaint.
        ¥ cut - does a copy and clears the selection to transparent.
        ¥ paste - paints the contents of the clipboard over the current selection. Only the starting point of the selection matters - the extent is controlled by the clipboard.

