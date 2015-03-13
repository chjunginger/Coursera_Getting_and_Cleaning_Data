# Coursera_Getting_and_Cleaning_Data
Code for the project of the Getting and Cleaning Data Course of JHU of Public Health on Coursera

The entire code is run_analysis.R. The working directory has to be the UCI HAR Dataset folder.

1. the plyr library is imported and the working directory set
2. The test and train datasets are concatenated for 
    a) the subject (subj)
    b) the covariates (X)
    c) the activities (Y) 
  in individual datasets
3. we parse through the feature table (features.txt), that contains all the labels of the covariates and use regular expressions (grepl) to find the indices of the covariates which names include mean or std ( the parenthesis need to be escaped). Their names are saved in indices_names and are made easier readable by eliminating () and -.
4. the covariate matix X is subsettet to only include the features found in step 3 and the columns are renamed by the names generated in step 3.
5. The activity-names are read in and are used to make dataset Y descriptive. (The former numeric coding of activites is now textbased)
6. subject, activity and covariates are bound together in the dataframe "dataset", now containing all the relevant information
7. as a last step, the tidy dataset from step 6 is aggregated to only contain means of the variables for each existing combination of subject and activity.
