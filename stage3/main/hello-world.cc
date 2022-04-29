#include <ctime>
#include <iostream>
#include <string>
#include "hello-greet.h"
#include "lib/hello-time.h"

int main()
{
    std::string who = "world";
    std::cout << get_greet(who) << std::endl;
    print_localtime();
    return 0;
}