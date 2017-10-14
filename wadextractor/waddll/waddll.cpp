// waddll.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#include "waddll.h"
#include "fstream.h"
#include <string>


BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
    switch (ul_reason_for_call)
	{
		case DLL_PROCESS_ATTACH:
		case DLL_THREAD_ATTACH:
		case DLL_THREAD_DETACH:
		case DLL_PROCESS_DETACH:
			break;
    }
    return TRUE;
}


// This is an example of an exported variable
WADDLL_API int nWaddll=0;

// This is an example of an exported function.
WADDLL_API int fnWaddll(void)
{
	return 42;
}

WADDLL_API void extractfile(long offset, long fsize, char* fname, char* wadfname)
{
	char *p_data;

	ofstream newfile (fname,ios::out|ios::binary|ios::app);

	//OPEN THE WADFILE
	ifstream wadfile;
	wadfile.open (wadfname,ios::in|ios::binary|ios::ate);

	wadfile.seekg(offset, ios::beg); // goto offset

	p_data = new char [fsize];
	wadfile.read(p_data,fsize);
	newfile.write(p_data , fsize);

	// release dynamically-allocated memory
	delete[] p_data;

	newfile.close();
	wadfile.close();
}

WADDLL_API void createfilelists(char* fname, char* offsfile, char* fsizefile, char* fnamefile)
{
	
	long size, offset, fsize;
	char temp;
	int str = 0;
	int zeros = 0;
	int addzeros = 0;
	int j =0;
	std::string fname1;
	//char * fname1;

	ifstream hedfile;
    hedfile.open (fname,ios::in|ios::binary|ios::ate);

	fsize=hedfile.tellg();				//get filesize of entire file
	  hedfile.seekg(0, ios::beg);

	  /*
	  fstream filenamesfile(fnamefile,ios::out);
	  fstream offsetfile(offsfile,ios::out);
	  fstream filesizefile(fsizefile,ios::out);
	  */

	  
	  ofstream filenamesfile ,offsetfile, filesizefile;
	  filenamesfile.open (fnamefile);
	  offsetfile.open (offsfile);
	  filesizefile.open (fsizefile);
	  

	  while(j < fsize)
	  {
	  temp = 0;
	  offset = 0;
	  size = 0;
	  zeros = 0;
	  addzeros = 0;
	  fname1.erase();

	  hedfile.seekg(j, ios::beg);
	  hedfile.read((char*)&offset,4);	//read offset
	  hedfile.read((char*)&size,4);		//read size of file

	  j = j + 9; //add 8 as 8bytes read and 1 to skip backslash
	  hedfile.seekg(j, ios::beg);

	  str = 0;
	  do
	  {
		j++;
		str++;
		hedfile.read((char*)&temp,1);
		fname1 = fname1 + temp;
		if (temp == '\\')
		{
			temp = '_';
			fname1.erase();
		}
	  } while(temp != 0);

	  // minus 1 because we have read zero above.
	  j = j -1;

	  //see how many trailing zeros to add
	  //zeros = (strlen(fname1.c_str())%4);
	  zeros = str % 4;
	  addzeros = 4 - zeros;

	  j = j + addzeros;

	  //set pointer to j
	  hedfile.seekg(j,ios::beg);
	  

	  filenamesfile << fname1.c_str() << "\n";
	  offsetfile << offset << "\n";
	  filesizefile << size << "\n";
	  //cout << fname.c_str() << endl;
	  


	  }
	
	  filenamesfile.close();
	  offsetfile.close();
	  filesizefile.close();
	  hedfile.close();

}

// This is the constructor of a class that has been exported.
// see waddll.h for the class definition
CWaddll::CWaddll()
{ 
	return; 
}

