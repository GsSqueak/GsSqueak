A HtmlReadWriter is used to read a Text object from a string containing HTML or writing a Text object to a string with HTML tags representing the text attributes.

It does two things currently:
1) Setting text attributes on the beginning of tags, e.g. setting a bold text attribute when seeing a <b> tag.
2) Changing the resulting string, e.g. replacing a <br> with a Character cr.

The implementation works by pushing attributes on a stack on every opening tag. On the corresponding closing tag, the attribute is poped from the stack and stored in an array of attribute runs. From this array the final string is constructed.

## Notes on the implementation
- The final run array is completely constructed while parsing so it has to be correct with regard to the length of the runs. There is no consolidation except for merging neighboring runs which include the same attributes.
- The *count* variable is the position in the source string, the *offset* is the number of skipped characters, for example ones that denote a tag.
- The stack contains elements which are of the form: {text attributes. current start index. original start}