import csv
import random
import string

# Função para gerar uma string aleatória de caracteres
def generate_random_string(length):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for _ in range(length))

# Lista com os estados
states = ['SP', 'RJ', 'MG', 'RS', 'PR', 'SC']

# Lista para armazenar as linhas do CSV
rows = []

# Gerar as 50 linhas
for _ in range(100000):
    first_name = generate_random_string(5)
    last_name = generate_random_string(8)
    email = f"{first_name.lower()}.{last_name.lower()}@example.com"
    password = generate_random_string(10)
    state = random.choice(states)
    street = generate_random_string(10)
    door = random.randint(1, 100)
    phone = f"({random.randint(10, 99)}) 9{random.randint(1000, 9999)}-{random.randint(1000, 9999)}"

    rows.append([first_name, last_name, email, password, state, street, door, phone])

# Nome do arquivo CSV
filename = "dados.csv"

# Escrever as linhas no arquivo CSV
with open(filename, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter=',')
    writer.writerow(['first_name', 'last_name', 'email', 'password', 'state', 'street', 'door', 'phone'])  # Escreve o cabeçalho
    writer.writerows(rows)

print(f"Arquivo '{filename}' gerado com sucesso!")
