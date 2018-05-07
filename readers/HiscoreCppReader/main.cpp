#include <iostream>
#include <stdio.h>
#include <tchar.h>
#include <fstream> // std::ifstream

#include "hiscore.h"

using namespace std;

int main(int argc, char* argv[])
{
	if (argc < 3) {
		cout << "Usage is -i <input file>\n";
		cin.get();
		exit(0);
	}
	else {
		char* fileName;
		if (string(argv[1]) == "-i") {
			fileName = argv[2];
			ifstream ifs(fileName, ifstream::binary);
			kaitai::kstream ks(&ifs);
			hiscore_t hiscore = hiscore_t(&ks);
			vector<hiscore_t::package_t*>* packages = hiscore.packages();
			vector<hiscore_t::package_t*>::iterator it = packages->begin();
			for (it; it != packages->end(); ++it) {
				hiscore_t::package_t* package = (hiscore_t::package_t*)*it;
				hiscore_t::header_t* header = package->hdr();
				printf("Event number: %d\n", header->event_number());
				printf("IP: %d\n", header->ip());
				printf("Magic: %d\n", header->magic());
			}
			return 0;
		}
		else {
			std::cout << "Not enough or invalid arguments, please try again.\n";
			exit(0);
		}
	}
}