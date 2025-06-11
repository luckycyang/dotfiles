return {
  {
    name = "Launch Rust Program (GDB)",
    type = "cppdbg", -- Use the cpptools adapter
    request = "launch",
    program = function()
      -- Ask for the executable path when launching
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    MIMode = "gdb",       -- Specify GDB
    miDebuggerPath = "gdb", -- Or full path to gdb if not in PATH
    -- setupCommands are executed at the beginning of the GDB session
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "Enable GDB pretty printing",
        ignoreFailures = false,
      },
      -- You might need to find the exact path to rust-gdb on your system
      -- It's usually in `~/.rustup/toolchains/<your-toolchain>/lib/rustlib/src/rust/etc/rust-gdb`
      -- Or system-wide if rustc was installed differently.
      -- Example: (ADJUST THIS PATH!)
      -- {
      --   text = "source ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/etc/rust-gdb",
      --   description = "Load Rust GDB extensions",
      --   ignoreFailures = true -- Set to true if the path might not always be valid
      -- }
    },
    -- If you want to pass arguments to your program:
    -- args = {"arg1", "arg2"},
  },
}
