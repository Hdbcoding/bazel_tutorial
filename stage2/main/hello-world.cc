#include <ctime>
#include <iostream>
#include <string>
#include "hello-greet.h"

void print_localtime()
{
    std::time_t result = std::time(nullptr);
    std::cout << std::asctime(std::localtime(&result));
}

int main()
{
    std::string who = "world";
    std::cout << get_greet(who) << std::endl;
    print_localtime();
    return 0;
}