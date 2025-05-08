// ../../MyGithub/HangmanGame/main.dart
import 'dart:io';
void main()
{
    String secretWord = "flutter";
    Set<String> guessedLetters = {};
    int attempts = 7;

    print("Hint :The word has ${secretWord.length} letters ");

    while(attempts > 0)
    {
        showWord(secretWord , guessedLetters);
        stdout.write('Enter a letter : ');
        String? input_letter = stdin.readLineSync();

        if (input_letter == null || input_letter.length != 1)
        {
            print("Please enter one letter only ");
            continue;
        }

        String lowerCase_letter = input_letter.toLowerCase();

        if(guessedLetters.contains(lowerCase_letter))
        {
            print("You already entered that letter");
            continue;
        }

        guessedLetters.add(lowerCase_letter);

        if(secretWord.contains(lowerCase_letter))
        {
            print("congratulations! Correct guess");
        }else{
            attempts--;
            print("Wrong guess. Try again ! There are $attempts attempts left");
        }

        bool allGuessedLetters = true;
        for(var lowerCase_letter in secretWord.split(''))
        {
            if(!guessedLetters.contains(lowerCase_letter))
            {
                allGuessedLetters = false;
                break;
            }
        }
        if(allGuessedLetters)
        {
            print("Congratulations! The word is $secretWord");
            break;
        }

        if(attempts == 0)
        {
            print("Game over! The word is $secretWord");
            break;
        }
    }

}
void showWord(String word ,Set<String> guessed )
{
    String display = '';
    for (var letter in word.split(''))
    {
        if(guessed.contains(letter))
        {
            display += '$letter' ;
        }else
        {
            display += '_ ';
        }
    }
    print("word : $display");

}