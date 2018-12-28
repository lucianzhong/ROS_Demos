#include "mex.h"
#include "matrix.h"
#include"ControlCAN.h"
#include <string.h>
#pragma comment(lib,"ControlCAN.lib")
void mexFunction(int nlhs, mxArray *plhs[],int nrhs, const mxArray *prhs[])
{

	if( nrhs != 3)  //判断输入参数的个数
	{
		mexErrMsgTxt("输入参数个数不对!");
	}
	double DevType  = *((double*)mxGetPr(prhs[0]));
	double DevIndex = *((double*)mxGetPr(prhs[1]));
	double CANIndex = *((double*)mxGetPr(prhs[2]));
	nlhs=2;
	PVCI_ERR_INFO  ptVCI_ERR_INFO = new VCI_ERR_INFO;
	plhs[0]=mxCreateDoubleMatrix(1,1,mxREAL);
	double *output1 =(double*)mxGetPr(plhs[0]);
	*output1 = VCI_ReadErrInfo(DevType,  DevIndex, CANIndex, ptVCI_ERR_INFO);
	mxArray *pa=NULL;
	const int dim[1]={3};
	plhs[1] = mxCreateCellArray(1,dim);
	pa= mxCreateDoubleMatrix(1,1,mxREAL);
	double *data=mxGetPr(pa);
	*data =ptVCI_ERR_INFO->ErrCode;
	mxSetCell(plhs[1],0,pa);

	char Passive_ErrData[3];
	memcpy(Passive_ErrData,ptVCI_ERR_INFO->Passive_ErrData,3);
	mxArray *mxstr= mxCreateString(Passive_ErrData);
	mxSetCell(plhs[1],1,mxstr);

	char ArLost_ErrData;
	ArLost_ErrData = ptVCI_ERR_INFO->ArLost_ErrData;
	mxArray *mxstr1= mxCreateString(&ArLost_ErrData);
	mxSetCell(plhs[1],2,mxstr1);
	delete ptVCI_ERR_INFO;
}
