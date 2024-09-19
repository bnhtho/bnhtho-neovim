## bnhtho/neovim's readme
This is my readme for my personal neovim configs

## Keymaps

<details>
  <summary>Coding</summary>


| Mode    | Keymap      | Function                                                   |
|---------|-------------|------------------------------------------------------------|
| Normal  | <kbd><leader></kbd> + <kbd>a</kbd> | Select all lines from the cursor position to the end of the file |
| Normal  | <kbd><leader></kbd> + <kbd>h</kbd> | Move to the window to the left |
| Normal  | <kbd><leader></kbd> + <kbd>j</kbd> | Move to the window below |
| Normal  | <kbd><leader></kbd> + <kbd>k</kbd> | Move to the window above |
| Normal  | <kbd><leader></kbd> + <kbd>l</kbd> | Move to the window to the right |
| Normal  | <kbd>s</kbd> + <kbd>j</kbd> | Split the current window horizontally and switch to the new window |
| Normal  | <kbd>s</kbd> + <kbd>l</kbd> | Split the current window vertically and switch to the new window |
| Normal  | <kbd>Ctrl</kbd> + <kbd>s</kbd> | Save the current file |
| Visual  | <kbd>></kbd> | Indent the selected lines to the right and maintain selection |
| Visual  | <kbd><</kbd> | Indent the selected lines to the left and maintain selection |
| Normal, Command | <kbd>Ctrl</kbd> + <kbd>h</kbd> | Navigate to the window to the left |
| Normal, Command | <kbd>Ctrl</kbd> + <kbd>l</kbd> | Navigate to the window to the right |
| Normal, Command | <kbd>Ctrl</kbd> + <kbd>k</kbd> | Navigate to the window above |
| Normal, Command | <kbd>Ctrl</kbd> + <kbd>j</kbd> | Navigate to the window below |
| Normal  | <kbd>Shift</kbd> + <kbd>Tab</kbd> | Switch to the last edited buffer |
| Normal  | <kbd><leader></kbd> + <kbd>w</kbd> | Close the current buffer |
| Normal  | <kbd>D</kbd> | Copy the current line or selection |
| Visual  | <kbd>Ctrl</kbd> + <kbd>d</kbd> | Copy the previous line in visual mode and maintain selection |
| Normal  | <kbd>j</kbd> | Move down a line, or down a wrapped line if line wrapping is enabled |
| Normal  | <kbd>k</kbd> | Move up a line, or up a wrapped line if line wrapping is enabled |
| Normal  | <kbd><leader></kbd> + <kbd>g</kbd> | Trigger live grep |
| Normal  | <kbd>q</kbd> + <kbd>:</kbd> | Placeholder for a custom command |
| Normal  | <kbd><leader></kbd> + <kbd>t</kbd> | Toggle the Neotree file explorer |
| Normal  | <kbd>Esc</kbd> | Close all floating windows |
| Normal  | <kbd><leader></kbd> + <kbd>`</kbd> | Toggle the terminal |
| Normal  | <kbd>b</kbd> + <kbd>j</kbd> | Split the buffer horizontally |
| Normal  | <kbd>b</kbd> + <kbd>h</kbd> | Split the buffer vertically |
| Command | <kbd>Down</kbd> | Move down the autocomplete suggestion list |
| Command | <kbd>Up</kbd> | Move up the autocomplete suggestion list |

</details>

---
<details>

<summary>LSP</summary>

| Mode  | Keymap              | Function                                                 |
|-------|---------------------|----------------------------------------------------------|
| Normal | <kbd>g</kbd> + <kbd>D</kbd> | Go to the declaration of the symbol under the cursor |
| Visual | <kbd>F</kbd> | Search and Replace |
| Normal | <kbd>g</kbd> + <kbd>d</kbd> | Go to the definition of the symbol under the cursor |
| Normal | <kbd>K</kbd> | Show hover information for the symbol under the cursor |
| Normal | <kbd>gi</kbd> | Go to the implementation of the symbol under the cursor |
| Normal | <kbd>Ctrl</kbd> + <kbd>k</kbd> | Show signature help for the function under the cursor |
| Normal | <kbd><<leader>></kbd> + <kbd>wa</kbd> | Add the current workspace folder |
| Normal | <kbd><<leader>></kbd> + <kbd>wr</kbd> | Remove the current workspace folder |
| Normal | <kbd><<leader>></kbd> + <kbd>wl</kbd> | List all workspace folders |
| Normal | <kbd><<leader>></kbd> + <kbd>D</kbd> | Go to the type definition of the symbol under the cursor |
| Normal | <kbd><<leader>></kbd> + <kbd>rn</kbd> | Rename the symbol under the cursor |
| Normal | <kbd><<leader>></kbd> + <kbd>ca</kbd> | Show code actions available for the symbol under the cursor |
| Normal | <kbd>gr</kbd> | Show references to the symbol under the cursor |
| Normal | <kbd><<leader>></kbd> + <kbd>f</kbd> | Format the current buffer asynchronously |

</details>
