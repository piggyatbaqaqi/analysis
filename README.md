analysis
========
This was produced by La Monte Henry Piggy Yarroll
<piggy.yarroll+coursera@gmail.com> in fulfillment of the Project for
the Coursera/Johns Hopkins "Getting and Cleaning Data" course.

This dataset is derived from
[UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
which originally came from
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
by running run_analysis.R in the current directory. The script assumes
that there is a subdirectory of the current working directory called
"UCI HAR Dataset".

Note the the implementation is tuned for ease of grading, not
necessarily for maintainability or generalizability. In particular,
the use of literal strings and no functions is deliberate.

Outline of run_analysis.R
=========================
- The script starts by getting the activity labels and feature names (columns).
- We then load the components of the training and testing datasets.
- We concatenate the bulk of the parameters to create a unified dataset.
- We subset these data by extracting the std and mean columns.
- We can the paste in the experimental subjects.
- In order to get descriptive names for activities, we add the
  activity codes (numbers) and then do a merge of the full dataset
  with the activity labels. We can then remove the activity codes as
  we no longer need them.
- We then rewrite the column names by expanding various abbreviations
  and removing extra dots.
- Finally, we can create the tidy dataset.
-- We extract subject and activity because we do not wish to apply mean
   to them and they will be put back in by aggregate().
-- We give the columns new names, clean up subject and activity, and
   emit the table.

The dataset includes the following files:
=========================================
- README.md

- codebook.md: Gives a description of the variables in the dataset.

- UCI_HAR_tidy.txt: A space-separated table with header of the summary data.

- run_analysis.R: The script used to generate the tidy dataset from
  the original UCI HAR Dataset. Simply source it from a directory
  containing "UCI HAR Dataset/" as a subdirectory.
