// cpp program
// console based calculator
#include <iostream>
#include <math.h>
bool close = false;
int num1, num2, ans;
char opr;
int main(int argc, char const *argv[])
{
    /* code */
    while (!close)
    {
        /* code */
        std::cout << "\nWelcome to Calculator\nEnter Num1 : ";
        std::cin >> num1;
        std::cout << "Enter Num2 : ";
        std::cin >> num2;
        std::cout << "Enter Operator : ";
        std::cin >> opr;
        switch (opr)
        {
        case '+':
        {
            std::cout << "Answer = " << (num1 + num2);
            break;
        }
        case '-':
        {
            std::cout << "Answer = " << (num1 - num2);
            break;
        }
        case '*':
        {
            std::cout << "Answer = " << (num1 * num2);
            break;
        }
        case '/':
        {
            std::cout << "Answer = " << (num1 / num2);
            break;
        }
        default:
        {
            std::cout << "Invalid !\n\n";
            break;
        }
        }
    }

    return 0;
}
