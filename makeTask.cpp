#include <iostream>
#include <string>
#include <stdlib.h>

std::string random_line();

const int Lines = 200000;
const int key2_line = 365;

int main(int argc, char *argv[])
{
  if (argc != 3) 
    {
      std::cout << "You need to supply the strings as parameters" << std::endl;
      exit(1);
    }
  
  for(int i = 0; i < Lines; i++)
    {
      if (i != Lines - key2_line)
	std::cout << random_line() << std::endl;
      else
	std::cout << argv[2] << std::endl;
    }
  std::cout << std::endl;
  std::cout << argv[1] << std::endl;
}

std::string random_line()
{
  return std::string("No random line is implemented yet, but do you expect this? ;)");
}

