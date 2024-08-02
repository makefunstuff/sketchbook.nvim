# sketchbook.nvim - simple notetaking

Motivation behind this thing, that I tried lots of notetaking tools but nothing really clicked.
I didn't want to leave nvim and it's not really convenient to manage ~/notes directory. 


## Demo

![Watch the video](https://github.com/makefunstuff/sketchbook.nvim/raw/main/demo.mp4)

## Warn

This was quick and dirty implementation, so not everything will perfectly because currently its in "works on my machine" state.


## Features

- **Quick Note Creation**: Quickly create and manage notes.
- **Template Selection**: Choose from predefined templates for your notes.
- **Note Searching**: Search through your notes easily.
- **Git Integration**: Commit and push your notes to a Git repository.
- **Floating Windows**: Use floating windows for quick notes.

## Installation

You can install Sketchbook using [lazy.nvim](https://github.com/folke/lazy.nvim).

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add the following to your `lazy.nvim` configuration:

```lua
require('lazy').setup({
    {
        'makefunstuff/sketchbook.nvim',
        lazy = false,
        config = function()
            require('sketchbook').setup({
                notes_directory = "~/my_notes/",
                templates_directory = "~/my_notes/templates/",
                keymaps = {
                    create_note = "<leader>nc",
                    update_index = "<leader>ni",
                    search_notes = "<leader>ns",
                    select_template = "<leader>nt",
                    create_quick_note = "<leader>nq",
                    toggle_quick_note = "<leader>qc", -- Keymap for toggling quick note window
                    open_entire_quick_note = "<leader>nqe",
                    commit_notes = "<leader>ngc",  -- Keymap for committing notes
                    push_notes = "<leader>ngp",    -- Keymap for pushing notes
                }
            })
        end
    }
})

```

## TODO:

- [ ] improve git Integration
- [ ] fix telescope issues with indexing
- [ ] add auto indexing
