#ifndef HAWLTZ_VM_H
#define HAWLTZ_VM_H


typedef struct HawltzVM HawltzVM;


HawltzVM* HawltzVM_Create(void);
void HawltzVM_Destroy(HawltzVM* vm);

void HawltzVM_Reset(HawltzVM* vm);
void HawltzVM_SetProgram(HawltzVM* vm, uint8_t* code, size_t code_size);


#endif
