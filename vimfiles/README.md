
### Understanding Defx

Defx is a vim file explorer by github.com/Shougo which works very well
on neovim.

It does not come with any default key-mappings. Outlined in the defx
documentation are the relevant commands, options, functions and actions.
Defx actions allow you to do ordinary file explorer tasks like opening a file,
changing a directory, opening a directory, and so on. Defx functions primarily
handle the dispatch of those actions. 

When defining key maps to perform defx actions, make sure that the key mappings
are buffer local to Defx buffer only. This will help you use simpler and more
intuitive keymaps. Refer to Defx documentation to learn more about how to define
keymaps and how to map keymaps to actions.

Some things to keep in mind when you're setting up your defx configuration are:

1. `defx#do_action` takes two arguments; first, the defx action to perform, and
   second a list of the arguments to pass to that action. If there's only 1
   argument to pass to that action, you can have a non-list argument.
   Internally, it is converted to a singleton list before the action is run.
   For example, for the action 'open', the arguments are given like so
   
   1. If passing in no args:  
		`map <silent><buffer><exec> o defx#do_action('open')`
		Note: you can also pass in an empty list
   2. If passing in only a single argument:
		`map <silent><buffer><exec> o defx#do_action('open', 'arg1')`
			Or
		`map <silent><buffer><exec> o defx#do_action('open', ['arg1'])`
   3. If passing in multiple arguments:
		`map <silent><buffer><exec> o defx#do_action('open', ['arg1', ...])`
