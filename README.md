# sketchbook.nvim - simple notetaking

Motivation behind this plugin is simple, I want to keep my notes in markdown files and make nvim features help me to manage it.


## Demo



https://github.com/user-attachments/assets/ddd785f1-aea4-40b3-8422-d75efd82bfc1



## Warn

This is quick and dirty implementation, something will probably won't work for you. Currently it's in 'works on my machine' state.


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
