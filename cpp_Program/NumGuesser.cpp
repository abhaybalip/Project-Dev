// cpp program
// number guessing game
#include <iostream>
#include <ctime>
#include <random>
int rand_number = 0, guess_num = 0;
bool stop_game = false;
int main(int argc, char const *argv[])
{
    /* code */
    srand(time(0));

    while (!stop_game)
    {
        /* code */
        rand_number = rand() % 10;
        std::cout << "Guess The Number >> ";
        std::cin >> guess_num;
        if (guess_num == rand_number)
        {
            stop_game = true;
            std::cout << "Random Number = " << rand_number;
            std::cout << "\n*** Congratulation ***\nYou've Guessed correct Number\n\n";
        }
        else
        {
            rand_number = rand();
            std::cout << "Try Again\n\n";
        }
    }

    return 0;
}
