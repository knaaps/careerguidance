import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import LabelEncoder
import pickle

# load the data into a pandas dataframe
data = pd.read_csv('output.csv')

# encode non-numeric values
le = LabelEncoder()
for column in data.columns:
    if data[column].dtype == np.object:#np.object
        data[column] = le.fit_transform(data[column])

# perform exploratory data analysis
print(data.describe())
print(data.corr())
# create visualizations

# split the data into training and testing sets
X = data.drop('suggested_job_roll', axis=1)
y = data['suggested_job_roll']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# train the model
model = DecisionTreeClassifier()
model.fit(X_train, y_train)

# evaluate the model
score = model.score(X_test, y_test)
print('Accuracy:', score)

# print other evaluation metrics such as confusion matrix, classification report, etc.

# save the model to a .pkl file
with open('model5.pkl', 'wb') as f:
    pickle.dump(model, f)
