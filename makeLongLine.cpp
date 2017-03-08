#include <iostream>
#include <string.h>
#include <stdlib.h>

std::string random_line();

const int Lines = 20000;
const int key_line = 700;

int main(int argc, char *argv[])
{
  if (argc != 2) 
    {
      std::cout << "You need to supply to string as parameters" << std::endl;
      exit(1);
    }
  
  for(int i = 0; i < Lines; i++)
    {
      if (i != key_line - 1)
	std::cout << random_line() ;
      else
	std::cout << argv[1];
    }
  std::cout << std::endl;
  int start_postion = random_line().size()*(key_line - 1) + 1; 
  int end_postion = start_postion + strlen(argv[1]);
  std::cout << "Your task is in the first line. The text position is from "
	    << (start_postion) << " to " << (end_postion) << " characters." << std::endl; 
}

std::string random_line()
{
  return std::string("No random line is implemented yet, but do you expect this? ;)");
}

