#include <iostream>
#include <stdio.h>
#include <tchar.h>
#include <fstream> // std::ifstream

#include "hiscore.h"

using namespace std;

int main() 
{
	ifstream ifs("./hiscore", ifstream::binary);
	kaitai::kstream ks(&ifs);
	hiscore_t hiscore = hiscore_t(&ks);
	return 0;
}