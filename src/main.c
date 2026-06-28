#include <stdint.h>

#include "hawltz/vm.h"
#include "hawltz/error.h"


static uint8_t prog[] =
{
    0x00
};


int main(void)
{
    HawltzVM* vm = HawltzVM_Create();
    if (!vm) return HawltzError_Get();
    
    HawltzVM_SetProgram(vm, prog, sizeof(prog));
    
    HawltzVM_Destroy(vm);
    return 0;
}
