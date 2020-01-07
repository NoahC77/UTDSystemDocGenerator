/*	A basic c++ program which takes in a list of names of .rst files from the root Makefile
 *and adds their names to the index.rst such that Sphinx can properly generate a set of .html
 *documents
 */
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

int main (int argc, char** argv){
	const std::string fakeFilePath = "./index.rst";
	const std::string filePath = "./GanymedeDocs/source/index.rst";

	const std::string header = ".. SPuppersysnameDocs documentation master file, created by\n   sphinx-quickstart on Wed Sep 11 09:12:41 2019.\n   You can adapt this file completely to your liking, but it should at least\n   contain the root `toctree` directive.\n\nWelcome to SPuppersysName's documentation!\n==========================================\n\n.. toctree::\n   :maxdepth: 1\n   :caption: Contents:\n\n";
	const std::string footer = "Indices and tables\n==================\n\n* :ref:`genindex`\n* :ref:`modindex`\n* :ref:`search`";
	std::string temp;	
	bool valid = true;
	std::vector<std::string> fileNames;
	std::ofstream indexFile;

	// Copying all command line arguments into the vector except the first one.
	for(int c = 1; c < argc; c++)
		fileNames.push_back(argv[c]);
	
	// Making sure only rst files were sent into prog. If not, then program ends.
	for(int c = 0; c < fileNames.size() && valid; c++){
		temp = fileNames.at(c);
		
		if(temp.size() < 4 || temp.substr(temp.size() - 4, temp.size()) != ".rst")
			valid = false;

		if(valid){
			temp = temp.substr(0, temp.size() - 4);
			fileNames.at(c) = temp;
		}
	}

	if(valid){

		// TODO: make sure to change this when the program is working
		indexFile.open (fakeFilePath, std::ios::trunc);

		// Writing contents which are the same for any index.rst, regardless of file names.
		indexFile << header;

		// Writing all the file names given into the index.rst
		for(int c = 0; c < fileNames.size(); c++)
			indexFile << "   " << fileNames.at(c) << std::endl;
		indexFile << std::endl;
	
		// Writing the contents below the file names which are the same for any index.rst, regardless of file names.
		indexFile << footer << std::endl;

		indexFile.close();
		
		std::cout << 1;
	}else{
		std::cout << 0;
	}
}
