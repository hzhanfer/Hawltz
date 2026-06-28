#include "hawltz/error.h"


static HawltzError _err = HAWLTZ_ERROR_NONE;


void HawltzError_Set(HawltzError err)
{
    _err = err;
}

HawltzError HawltzError_Get(void)
{
    return _err;
}
