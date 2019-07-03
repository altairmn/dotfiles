
	1. Find a way to select a line with all occurrences of a list in clipboard
	 Put other way, highlight all the matching lines (or areas) which match
	 all the lines in "\n" separated list or "," separated
	2. Open a temp file and initialize with random guid, also maintain a list
	of tmp buffers

DefX
	Mark files which have diff with given commits. Have a command for that
	have shortcut for Opening Defx in a new tab on a default directory (or
	give prompt to open in a particular directory)

	- open logic
	  - on o or <CR>, either open as a horizontal split (if editing a non
	  [New File]) or open as a new split. split logic is given below
	  - if chosing 's, then open as horizontal split in current tab
		 (split the previous window in that tab)
	  - if choosing 'v, then open as vertical split
	     (split the previous window in that tab)

	- ag in current directory and show the results, and navigate
	through the results
	- start nvim in home directory by default not windows dir
	
	- add feature in defx to open a dir by path
	  - give either full path or relative path to the current dir

Json Format

	Prettify selection according to JSON prettifying 
		- assume that the selected text is valid JSON

Bookmarked Dirs

	- Introduce autocomplete for bookmarked dirs
	- introduce a method to bookmark dirs
	- create mappings in defx to add a dir to bookmarks
	- create markings in defx to show that a dir is bookmarked

Git

  - shortcut to commit the current file
  - shortcut to go through all the merge conflicts
