import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
import pickle
import json

# Load the data
print("Loading data...")
data = pd.read_csv('output.csv')
print(f"Dataset shape: {data.shape}")
print(f"Columns: {data.columns.tolist()}")

# Separate features and target
X = data.drop('suggested_job_roll', axis=1)
y = data['suggested_job_roll']

# Check for missing values
print("\nMissing values:")
print(data.isnull().sum())

# Encode target variable (job roles)
print("\nEncoding target variable...")
target_encoder = LabelEncoder()
y_encoded = target_encoder.fit_transform(y)

# Store the label mapping for later use
job_role_mapping = {idx: label for idx, label in enumerate(target_encoder.classes_)}
print(f"\nJob roles found: {len(job_role_mapping)}")
print("Sample roles:", list(job_role_mapping.values())[:5])

# Encode categorical features (if any exist)
# For this dataset, all features appear to be numeric, but let's check
encoders = {}
X_encoded = X.copy()

for column in X.columns:
    if X[column].dtype == 'object':
        print(f"Encoding categorical column: {column}")
        encoder = LabelEncoder()
        X_encoded[column] = encoder.fit_transform(X[column])
        encoders[column] = encoder

# Split the data - stratify to maintain class distribution
print("\nSplitting data...")
X_train, X_test, y_train, y_test = train_test_split(
    X_encoded, y_encoded, 
    test_size=0.2, 
    random_state=42,
    stratify=y_encoded  # Ensure balanced splits
)

print(f"Training set: {X_train.shape}")
print(f"Test set: {X_test.shape}")

# Train the model with better parameters
print("\nTraining Decision Tree model...")
model = DecisionTreeClassifier(
    max_depth=10,           # Prevent overfitting
    min_samples_split=20,   # Require minimum samples to split
    min_samples_leaf=10,    # Require minimum samples in leaf
    random_state=42
)
model.fit(X_train, y_train)

# Evaluate the model
print("\n" + "="*50)
print("MODEL EVALUATION")
print("="*50)

# Training accuracy
train_predictions = model.predict(X_train)
train_accuracy = accuracy_score(y_train, train_predictions)
print(f"\nTraining Accuracy: {train_accuracy:.4f}")

# Test accuracy
test_predictions = model.predict(X_test)
test_accuracy = accuracy_score(y_test, test_predictions)
print(f"Test Accuracy: {test_accuracy:.4f}")

# Cross-validation score
cv_scores = cross_val_score(model, X_train, y_train, cv=5)
print(f"\nCross-Validation Scores: {cv_scores}")
print(f"Mean CV Score: {cv_scores.mean():.4f} (+/- {cv_scores.std() * 2:.4f})")

# Classification report
print("\nClassification Report:")
print(classification_report(
    y_test, 
    test_predictions, 
    target_names=target_encoder.classes_,
    zero_division=0
))

# Confusion Matrix (show sample)
conf_matrix = confusion_matrix(y_test, test_predictions)
print(f"\nConfusion Matrix shape: {conf_matrix.shape}")

# Feature importance
feature_importance = pd.DataFrame({
    'feature': X.columns,
    'importance': model.feature_importances_
}).sort_values('importance', ascending=False)

print("\nTop 10 Most Important Features:")
print(feature_importance.head(10).to_string(index=False))

# Save everything needed for predictions
print("\n" + "="*50)
print("SAVING MODEL AND ARTIFACTS")
print("="*50)

# 1. Save the trained model
with open('model.pkl', 'wb') as f:
    pickle.dump(model, f)
print("✓ Model saved to 'model.pkl'")

# 2. Save the target encoder
with open('target_encoder.pkl', 'wb') as f:
    pickle.dump(target_encoder, f)
print("✓ Target encoder saved to 'target_encoder.pkl'")

# 3. Save feature encoders (if any)
if encoders:
    with open('feature_encoders.pkl', 'wb') as f:
        pickle.dump(encoders, f)
    print("✓ Feature encoders saved to 'feature_encoders.pkl'")

# 4. Save feature names (important for prediction)
with open('feature_names.pkl', 'wb') as f:
    pickle.dump(X.columns.tolist(), f)
print("✓ Feature names saved to 'feature_names.pkl'")

# 5. Save metadata as JSON for easy reference
metadata = {
    'model_type': 'DecisionTreeClassifier',
    'n_features': len(X.columns),
    'feature_names': X.columns.tolist(),
    'n_classes': len(target_encoder.classes_),
    'job_roles': job_role_mapping,
    'test_accuracy': float(test_accuracy),
    'train_accuracy': float(train_accuracy),
    'cv_mean_score': float(cv_scores.mean()),
    'training_date': pd.Timestamp.now().isoformat()
}

with open('model_metadata.json', 'w') as f:
    json.dump(metadata, indent=2, fp=f)
print("✓ Metadata saved to 'model_metadata.json'")

print("\n" + "="*50)
print("TRAINING COMPLETE!")
print("="*50)
print("\nFiles created:")
print("  - model.pkl")
print("  - target_encoder.pkl")
print("  - feature_names.pkl")
print("  - model_metadata.json")
if encoders:
    print("  - feature_encoders.pkl")

print("\nYou can now use these files to make predictions on new data!")
