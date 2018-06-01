TwoWayScrollPane is now obsolete.  You should be able to use ScrollPane to do both vertical and horizontal scrolling.

As an example, see Morph>>inATwoWayScrollPane and change the first line to create a ScrollPane instead of a TwoWayScrollPane.  It will still work.

(EllipseMorph new extent: 200@150) inATwoWayScrollPane openInWorld

Note that user preferences for ScrollPane may be geared toward text scrolling, so that the horizontal scrollbar may be hidden when not needed, while the vertical scrollbar is always shown.  Use ScrollPane>>alwaysShowHScrollbar: or its variants to adjust this if you want the vertical & horizontal scrollbars to be shown consistently.
