print("""
           💥 \033[1mEl ahorcado\033[0m 💥\n
    Estas son las reglas del juego:\n
1. Un jugador intenta adivinar letras para completar la palabra elegido por el ordenador.
2. Si el jugador adivinador adivina una letra correctamente, se revela en su lugar correspondiente.
3. Si el jugador adivinador adivina incorrectamente, se dibuja una parte del cuerpo en la horca.
4. El objetivo del jugador adivinador es adivinar la palabra antes de que se dibuje el dibujo completo en la horca.\n""")


import random

def obtain_random_word():
    word=["perro","casa","programadoras","data","mejor","vacaciones","elefante","gato","python","alumna","escuela","formacion","chocolate"]
    random_word= random.choice(word)
    return random_word
def show_board(secret_word, guessed_letters):
    board = ""
    for letter in secret_word:
        if letter in guessed_letters:
            board += " " + letter + " "
        else:
            board += " _ "
    print(board)
dibujo = [
    '''
       +---+
       |   |
           |
           |
           |
           |
    =========\n
    ''',
    '''
       +---+
       |   |
       O   |
           |
           |
           |
    =========\n
    ''',
    '''
       +---+
       |   |
       O   |
       |   |
           |
           |
    =========\n
    ''',
    '''
       +---+
       |   |
       O   |
      /|   |
           |
           |
    =========\n
    ''',
    '''
       +---+
       |   |
       O   |
      /|\  |
           |
           |
    =========\n
    ''',
    '''
       +---+
       |   |
       O   |
      /|\  |
      /    |
           |
    =========\n
    ''',
    '''
       +---+
       |   |
       O   |
      /|\  |
      / \  |
           |
    =========\n
    '''
]
def play():
    secret_word =obtain_random_word()
    wrong_letters = []
    guessed_letters =[]
    lifes=7
    while lifes > 0:
        show_board(secret_word, guessed_letters)
        letter=input("✒️ Introduce una letra: \n").lower()
        if letter in guessed_letters or letter in wrong_letters:
            print("🤭 Esta letra ya ha sido dicha. Try again 🤭\n")
            print(f"Te quedan {lifes} vidas\n")
            continue
        elif letter in secret_word:
            guessed_letters.append(letter)
            if set(guessed_letters) == set(secret_word):
                print("🏆 Enhorabuena, has ganado!\n 🏆")
                break
        else:
            wrong_letters.append(letter)
            print(f"😱 Letra incorrecta. Te quedan {lifes -1} vidas 😱\n")
            print(dibujo[7-lifes])
            lifes -=1
    if lifes == 0:
        print(f"💀 No te quedan más vidas, la palabra secreta era {secret_word}. Juega otra vez para intentar ganar! 💀\n")
        print(dibujo[6])


play()