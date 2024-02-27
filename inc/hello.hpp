#pragma once

#include <cstdio>

/// @defgroup main main
/// @{

/// @brief print single cmd.line argument
/// @param argc index
/// @param argv value
extern void arg(int argc, char argv[]);

/// @brief executable entry point
/// @param argc number of cmd.line arguments
/// @param argv binary name + arguments
extern int main(int argc, char *argv[]);

/// @}
