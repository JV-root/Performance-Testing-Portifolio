import csv

def delete_rows(file_path, num_rows):
    rows_to_skip = num_rows

    # Read the contents of the CSV file
    with open(file_path, 'r') as file:
        reader = csv.reader(file)
        rows = list(reader)

    # Write the updated content back to the CSV file
    with open(file_path, 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(rows[0])  # Write the header row
        writer.writerows(rows[1+rows_to_skip:])

    print("Rows deleted successfully.")

# Example usage
file_path = 'dados.csv'
num_rows = 40000

delete_rows(file_path, num_rows)
