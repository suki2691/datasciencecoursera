The script does the following steps-

1. Merging testing and training data together
2. Getting column names for final data set
3. Defining measurements performed on main data set in the dataset
4. Subsetting from main data set
5. Naming the activities in the subset of attributes data
6. Making a tidy data set for output
7. Output the tidy data set to text file

Variable description

1. x_train- training data from x_train.txt
2. y_train- training data from y_train.txt
3. subject_train- training data from subject_train.txt
4. x_test- testing data from x_test.txt
5. y_test- testing data from y_test.txt
6. subject_test- testing data from subject_test.txt
7. features- reading data from features.txt
8. activityLabels- reading data from activity_labels.txt
9. test_data- merging testing data
10. train_data- merging training data
11. final_data- merging testing and training data together
12. clnames- getting the names for the columns in final data set
13. attributes_flag- flagging the colummns with the measurements like mean and stddev
14. attributes_data- getting the data from the flagged columns
15. Final_tidy_set- getting the final tidy data set