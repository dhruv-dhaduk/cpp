# C++ Project setup

> [!WARNING]
> This setup only works for UNIX like systems. If you are using Windows, you can use [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

### Structure of the project
- `src/` folder contains all `.cpp` source files.
- `include/` folder contains all `.hpp` header files.
- `make` is used to structure the compilation of the project.
- `g++` compiler is used for compilation.
- After compilation, all object files, executables are stored in `build/` folder.
- In `build/` folder, all object files are structured same as the source files in `src/` folder.
- All object files are linked and a single executable `build/app` is created.

### How to compile the project
- To compile the projct, run :
```bash
make
```

### How to run the project
- To run the projct, run :
```bash
./build/app
```

### How to compile and run
- To compile and run using single command, run :
```bash
make run
```


## For Neovim users
- If you want to use LSP in neovim, you need a compilation database as `compile_commands.json` at the root of your project.
- You can use [bear](https://github.com/rizsotto/Bear) to generate this file.
- In this case, you have to use following command to compile/run the project :
```bash
bear -- make
```