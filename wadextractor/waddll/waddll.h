
// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the WADDLL_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// WADDLL_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#ifdef WADDLL_EXPORTS
#define WADDLL_API __declspec(dllexport)
#else
#define WADDLL_API __declspec(dllimport)
#endif

// This class is exported from the waddll.dll
class WADDLL_API CWaddll {
public:
	CWaddll(void);
	// TODO: add your methods here.
};

extern WADDLL_API int nWaddll;

extern "C" WADDLL_API int fnWaddll(void);

extern "C" WADDLL_API void extractfile(long offset, long fsize, char* fname, char* wadfname);

extern "C" WADDLL_API void createfilelists(char* fname, char* offsfile, char* fsizefile, char* fnamefile);

