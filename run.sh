#!/bin/bash

# Create a directory for output files if it doesn't exist
OUTPUT_DIR="sm_test_results"
mkdir -p $OUTPUT_DIR

# Define an array of SM values to test
# These values should work for both A100 (108 SMs) and H100 (132 SMs)
SM_VALUES=(8 16 24 32 48 64 80 96)

# Loop through each SM value
for sms in "${SM_VALUES[@]}"; do
  echo "Running test with $sms SMs..."
  
  # Run the Python script with the current SM value and save output
  # The 2>&1 redirects both stdout and stderr to the output file
  python tests/test_intranode.py --num_sms $sms > "$OUTPUT_DIR/result_${sms}_sms.txt" 2>&1
  
  # Add a small delay between runs to ensure system resources are freed
  sleep 2
  
  echo "Completed test with $sms SMs. Output saved to $OUTPUT_DIR/result_${sms}_sms.txt"
done

echo "All tests completed. Results are in the $OUTPUT_DIR directory."