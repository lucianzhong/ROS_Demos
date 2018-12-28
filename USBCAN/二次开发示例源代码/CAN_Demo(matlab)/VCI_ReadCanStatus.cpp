#include "mex.h"
#include"ControlCAN.h"
#include <string.h>
#pragma comment(lib,"ControlCAN.lib")
void mexFunction(int nlhs, mxArray *plhs[],int nrhs, const mxArray *prhs[])
{

	if( nrhs != 3)  //判断输入参数的个数
	{
		mexErrMsgTxt("输入参数个数不对!");
	}
	double DevType =*((double*)mxGetPr(prhs[0]));
	double DevIndex =*((double*)mxGetPr(prhs[1]));
	double CANIndex =*((double*)mxGetPr(prhs[2]));

	PVCI_CAN_STATUS   ptVCI_CAN_STATUS = new VCI_CAN_STATUS;
	ptVCI_CAN_STATUS->ErrInterrupt   = *((double*)(mxGetPr(prhs[3])));
	ptVCI_CAN_STATUS->regMode        = *((double*)(mxGetPr(prhs[3])+1));
	ptVCI_CAN_STATUS->regStatus      = *((double*)(mxGetPr(prhs[3])+2));
	ptVCI_CAN_STATUS->regALCapture   = *((double*)(mxGetPr(prhs[3])+3));
	ptVCI_CAN_STATUS->regECCapture   = *((double*)(mxGetPr(prhs[3])+4));
	ptVCI_CAN_STATUS->regEWLimit     = *((double*)(mxGetPr(prhs[3])+5));
	ptVCI_CAN_STATUS->regRECounter   = *((double*)(mxGetPr(prhs[3])+6));
	ptVCI_CAN_STATUS->regTECounter   = *((double*)(mxGetPr(prhs[3])+7));
    ptVCI_CAN_STATUS->Reserved       = *((double*)(mxGetPr(prhs[3])+8));
	nlhs =2;
	plhs[0]=mxCreateDoubleMatrix(1,1,mxREAL);
	double *output =(double*)mxGetPr(plhs[0]);
	*output= VCI_ReadCANStatus(DevType,DevIndex,CANIndex,ptVCI_CAN_STATUS);
// 	plhs[1]=mxCreateDoubleMatrix(1,9,mxREAL);
// 	double *output1 = (double*)mxGetPr(plhs[1]);
// 	output1[0] = ptVCI_CAN_STATUS->ErrInterrupt;
// 	output1[1] = ptVCI_CAN_STATUS->regMode;
// 	output1[2] = ptVCI_CAN_STATUS->regStatus;
// 	output1[3] = ptVCI_CAN_STATUS->regALCapture;
// 	output1[4] = ptVCI_CAN_STATUS->regECCapture;
// 	output1[5] = ptVCI_CAN_STATUS->regEWLimit;
// 	output1[6] = ptVCI_CAN_STATUS->regRECounter;
// 	output1[7] = ptVCI_CAN_STATUS->regTECounter;
// 	output1[8] =  ptVCI_CAN_STATUS->Reserved;
// 	delete ptVCI_CAN_STATUS;



	mxArray *pa=NULL;
	const int dim[1]={9};
	plhs[1] = mxCreateCellArray(1,dim);
	pa= mxCreateDoubleMatrix(1,1,mxREAL);
	double *data=mxGetPr(pa);
	for (int i=0;i<9;i++)
	{
		pa = mxCreateDoubleMatrix(1,1,mxREAL);
		double *data = mxGetPr(pa);
		switch(i)
		{
		case 0:
			*data =ptVCI_CAN_STATUS->ErrInterrupt;

			break;
		case 1:
			*data = ptVCI_CAN_STATUS->regMode;
			break;
		case 2:
			*data = ptVCI_CAN_STATUS->regStatus;
			break;
		case 3:
			*data = ptVCI_CAN_STATUS->regALCapture;
			break;
		case 4:
			*data = ptVCI_CAN_STATUS->regECCapture;
			break;
		case 5:
			*data = ptVCI_CAN_STATUS->regEWLimit;
			break;
		case 6:
			*data = ptVCI_CAN_STATUS->regRECounter;
			break;
		case 7:
			*data = ptVCI_CAN_STATUS->regTECounter;
			break;
		case 8:
			*data = ptVCI_CAN_STATUS->Reserved;
			break;
		}
		mxSetCell(plhs[1],i,pa);
	}
	delete ptVCI_CAN_STATUS;
}
