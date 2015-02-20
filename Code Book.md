#run_analysis()
##Code Book

* **cols**	table of column names.  Created using the features.txt file, along with adding extra records
	for activity_code, subject, and source.

* **x_test**	table of measurements for the test data set.  Created using the test/x_test.txt file.

* **y_test**	table of activity codes.  Created using the test/y_test.txt file.

* **subj_test**	table of subjects.  Created using the test/subject_test.txt file.

* **test_data**	table that combines **x_test**, **y_test**, and **subj_test**, with column
		names from **cols**.

* **x_train**	table of measurements for the train data set.  Created using the train/x_train.txt
		file.

* **y_train**	table of activity codes.  Created using the train/y_train.txt file.

* **subj_train**	table of subjects.  Created using the train/subject_train.txt file.

* **train_data**	table that combines the columns from **x_train**, **y_train**, and **subj_train**,
		with column names from **cols**

* **data_source**	table that combines the records from **test_data** and **train_data**.

* **data_set**	table that transforms data_source by striping out all measurements that are not
		mean() or std(), and merges with **activity_labels** by activity_code.

* **activity_labels**	table that stores the join between activity code and activity label.  Is merged into
		**data_set** by activity_code.

* **result**	the result of **data_set** after it is transformed by striping out any unneeded columns,
		group by subject and activity, and then getting the mean of all the measurements.