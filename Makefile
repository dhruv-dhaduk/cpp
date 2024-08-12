# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -Iinclude
CXXFLAGS_DEBUG = $(CXXFLAGS) -g

# Source and build directories
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
OBJECTS_DIR = objects
DEBUG_BUILD_DIR = build/debug


# Find all source files in the src directory and its subdirectories
SRCS = $(shell find $(SRC_DIR) -name '*.cpp')

INCLUDES = $(shell find $(INCLUDE_DIR) -name '*.h')

# Generate corresponding object files in the build directory, preserving directory structure
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/$(OBJECTS_DIR)/%.o, $(SRCS))

OBJS_DEBUG = $(patsubst $(SRC_DIR)/%.cpp, $(DEBUG_BUILD_DIR)/$(OBJECTS_DIR)/%.o, $(SRCS))

# Target executable
TARGET = $(BUILD_DIR)/app
DEBUG_TARGET = $(DEBUG_BUILD_DIR)/app

# Default target: build all
all: $(TARGET)


run: $(TARGET)
	@./$<

# Build the executable by linking all object files
$(TARGET): $(OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Compile source files to object files, preserving directory structure
$(BUILD_DIR)/$(OBJECTS_DIR)/%.o: $(SRC_DIR)/%.cpp $(INCLUDES)
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

debug: $(DEBUG_TARGET)
	gdb ./$<

$(DEBUG_TARGET): $(OBJS_DEBUG)
	@mkdir -p $(DEBUG_BUILD_DIR)
	$(CXX) $(CXXFLAGS_DEBUG) -o $(DEBUG_TARGET) $(OBJS_DEBUG) 

$(DEBUG_BUILD_DIR)/$(OBJECTS_DIR)/%.o: $(SRC_DIR)/%.cpp $(INCLUDES)
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS_DEBUG) -c $< -o $@

# Clean target: remove all build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Phony targets
.PHONY: all clean run debug
