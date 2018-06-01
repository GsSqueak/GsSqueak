ObjectExplorerWrappers represent an item displayed in an object explorer tree. In addition to the common ListItemWrapper behavior it adds methods to refresh the list entry with updated values from the model. It is mostly used in #explorerContents methods to describe which instance variables of an object should be displayed in the explorer.

Additionally, the value displayed can be visualized with a small icon which is defined by the class of the value object through the method #iconOrThumbnailOfSize:.

Contributed by Bob Arning as part of the ObjectExplorer package.
