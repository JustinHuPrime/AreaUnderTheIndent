# Area Under the Indent Complexity Calculator

This program accepts an optional tab size argument, and a file argument, and prints out (to stdout) the complexity of the file as calculated by counting the number of spaces or space-equivalents under the indent. Note that the tab size must come first if it is given.

## Options

`-t<N>`: instructs the program to treat tabs as being equivalent to `N` spaces. Defaults to 2.