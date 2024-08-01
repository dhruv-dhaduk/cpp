# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -Iinclude

# Source and build directories
SRC_DIR = src
BUILD_DIR = build
OBJECTS_DIR = objects

# Find all source files in the src directory and its subdirectories
SRCS = $(shell find $(SRC_DIR) -name '*.cpp')

# Generate corresponding object files in the build directory, preserving directory structure
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/$(OBJECTS_DIR)/%.o, $(SRCS))

# Target executable
TARGET = $(BUILD_DIR)/app

# Default target: build all
all: $(TARGET)

# Build the executable by linking all object files
$(TARGET): $(OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Compile source files to object files, preserving directory structure
$(BUILD_DIR)/$(OBJECTS_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean target: remove all build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Phony targets
.PHONY: all clean