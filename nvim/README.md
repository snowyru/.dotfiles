# 💤 LazyVim

- Using stock LazyVim like a true lazy user
- (but with a custom dashboard and copilot enabled 😎)

---

## Must-Know LazyVim Keymaps

These are the most frequent keybinds, but all keymaps can be seen here: [LazyVim Keymaps Docs](https://www.lazyvim.org/keymaps).

---

### 1. Buffer / Tab Navigation

- **Next buffer:**  
  `]b`, `<S-l>`

- **Previous buffer:**  
  `[b`, `<S-h>`

- **Switch to other buffer:**  
  `<leader>bb`, `<leader>\``

- **Close current buffer:**  
  `<leader>bd`

- **Delete other buffers:**  
  `<leader>bo`

- **Pick buffer to close:**  
  `<leader>bD`

- **Switch to last buffer:**  
  `<leader><tab>l`

- **List open buffers:**  
  `<leader>,`, `<leader>fb`

---

### 2. Window (Split) Navigation

- **Go to left window:**  
  `<C-h>`

- **Go to right window:**  
  `<C-l>`

- **Go to lower window:**  
  `<C-j>`

- **Go to upper window:**  
  `<C-k>`

- **Increase window height:**  
  `<C-Up>`

- **Decrease window height:**  
  `<C-Down>`

- **Increase window width:**  
  `<C-Right>`

- **Decrease window width:**  
  `<C-Left>`

- **Split window below:**  
  `<leader>-`

- **Split window right:**  
  `<leader>|`

- **Close current window (split):**  
  `<leader>wd`

---

### 3. File Explorer

- **Toggle Explorer (Snacks):**  
  `<leader>fe` (root dir), `<leader>fE` (cwd)
- **Toggle Snacks Explorer:**  
  `<leader>e` (root dir), `<leader>E` (cwd)

---

### 4. Fuzzy Finding (Telescope/FZF/Snacks)

- **Find files (root dir):**  
  `<leader>ff`, `<leader><space>`

- **Find files (cwd):**  
  `<leader>fF`

- **Find files (git-files):**  
  `<leader>fg`

- **Find recent files:**  
  `<leader>fr`

- **Find recent files (cwd):**  
  `<leader>fR`

- **Grep (live search in files, root dir):**  
  `<leader>/`, `<leader>sg`

- **Grep (cwd):**  
  `<leader>sG`

- **Buffers:**  
  `<leader>,`, `<leader>fb`, `<leader>fB`

---

### 5. Miscellaneous

- **Open LazyVim menu:**  
  `<leader>L`

- **Open command palette/history:**  
  `<leader>fc`, `<leader>:`

- **Format file:**  
  `<leader>cf`

- **Open diagnostics (trouble):**  
  `<leader>xx`

- **Show keymaps cheatsheet (which-key):**  
  `<leader>?`

- **Toggle auto format (global):**  
  `<leader>uf`

- **Toggle auto format (buffer):**  
  `<leader>uF`

---

### Notes

- `<leader>` is usually mapped to `Space` by default in LazyVim.
- `<localleader>` is usually mapped to `\`.
- `<C-h>` means Ctrl+h, etc.
- Many more keymaps are available for LSP, Git, debugging, plugins, and advanced workflow!  
  For the full list, always refer to: [LazyVim Keymaps Docs](https://www.lazyvim.org/keymaps)

---

## For docs

Refer to the [docs](https://lazyvim.github.io/installation) to get started.
