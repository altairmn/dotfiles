
	1. Find a way to select a line with all occurrences of a list in clipboard
	 Put other way, highlight all the matching lines (or areas) which match
	 all the lines in "\n" separated list or "," separated
	2. Open a temp file and initialize with random guid, also maintain a list
	of tmp buffers. title the window, if it is titled using the first one

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


Project Plugin

	- Extending on the idea of having separate defx buffers for 
	  different tabs
	- The plugin allows you to open a "Project", and link a defx buffer
	with it
	- The title of the tab would be the name of the project (or root dir
	of the project)
	- Multiple tabs for the same project can be opened and they'll share the
	defx buffer.
	- Closing and reopening the defx buffer will open at Project root
	- The plugin will also have a tracking buffer for that project
	  most notably, MRU files for that project
	  files that have been edited recently
	  files that show up in gitdiff
	- This plugin could serve as a base for building the icm plugin
	wherein, each icm incident would be a project with extra icm specific
	features for retrieving open icms, retreiving icm info from URL, etc.

	Perhaps the ICM specific features can be implemented by adding a "project
	type" feature to the Project plugin. If the project type is icm incident,
	it adds certain bindings to all buffers and so on.
	It could be a latex project for instance, etc.
	It'll also change the behavior of defx depending on project type.


Bookmarked Dirs

	- Introduce autocomplete for bookmarked dirs
	- introduce a method to bookmark dirs
	- create mappings in defx to add a dir to bookmarks
	- create markings in defx to show that a dir is bookmarked

Git

  - shortcut to commit the current file
  - shortcut to go through all the merge conflicts
