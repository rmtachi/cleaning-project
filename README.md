(December 20, 2014)

# Repository content summary

This repository contains all data and scripts necessary to read and clean the UCI Human Activity Response dataset. More details of the scripts will follow.

The primary script is `run\_analysis.R`. This script includes code for dowloading and unzipping the compressed data. It can be run without modifications, except for the first line that sets the working directory in which the data folders and scripts will be stored.

The script stores the compressed file in the `data` folder and extracts the files into separate folder in the working directory. After processing the dataet it writes the tidy datasets `HAR_mean_sd.txt` and `HAR_summary.txt` to the `data` folder.s

The `functions.R` file contains only one relevant function - for reading in the feature vector datasets. The function uses `readLine`, as it is marginally faster than `data.frame` and the text file was not formatted properly for `fread` to run (with default settings). This file is sourced by `run\_analysis.R`.

The `CodeBook.md` describes the original data, processing, and contents of the generated datasets.

The `.RData` file should contain the data remaining after execution of the script, however the data may change, so this file should be used with caution.

The `.gitignore` contains instructions to skip R Studio project files and R history files, as well as script used to store experimental code.

[//]: # (December 21, 2014)
