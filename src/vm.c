#include <stdlib.h>
#include <stdint.h>

#include "vm.h"
#include "hawltz/error.h"


HawltzVM* HawltzVM_Create(void)
{
    HawltzVM* vm = malloc(sizeof(HawltzVM));
    if (!vm)
    {
        HawltzError_Set(HAWLTZ_ERROR_OOM);
        return NULL;
    }
    
    HawltzVM_Reset(vm);
    
    return vm;
}

void HawltzVM_Destroy(HawltzVM* vm)
{
    free(vm);
}


void HawltzVM_Reset(HawltzVM* vm)
{
    vm->code = NULL;
    vm->code_size = 0;
    vm->code_ip = 0;
    vm->code_ret_ip = 0;
    vm->code_exstat = 0;
}

void HawltzVM_SetProgram(HawltzVM* vm, uint8_t* code, size_t code_size)
{
    vm->code = code;
    vm->code_size = code_size;
}

int HawltzVM_GetExitStatus(HawltzVM* vm)
{
    return vm->code_exstat;
}
