#ifndef HAWLTZ_ERROR_H
#define HAWLTZ_ERROR_H



typedef enum HawltzError
{
    HAWLTZ_ERROR_NONE = 0,
    
    HAWLTZ_ERROR_OOM
} HawltzError;


void HawltzError_Set(HawltzError err);
HawltzError HawltzError_Get(void);


#endif
