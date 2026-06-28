#ifndef VM_H
#define VM_H


#include <stdlib.h>
#include <stdint.h>

#include "hawltz/vm.h"


struct HawltzVM
{
    // code
    uint8_t* code;
    size_t
        code_size,
        code_ip, // code instruction pointer
        code_ret_ip // return pointer
    ;
    int code_exstat; // exit stat
};


#endif
