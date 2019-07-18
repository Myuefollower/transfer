#include <nvml.h>
#include <stdlib.h>
#include <stdio.h>
#include <percounter.h>

int main(int argc, char *argv[]){

//init
    if(init() == 0){
		printf("nvml init succ.\n");
	} else {
		printf("nvml init err.\n");
		return 1;
	}
    
//For Variable and malloc
	unsigned int length = 100;
    nvmlDevice_t device;
	
	char *devicename = (char*)malloc(sizeof(char)*length);
	
	unsigned int linkwid;

    unsigned int pciethroughput;	
	
	unsigned int pcieReplayCount;
	
	unsigned int fanspeed;
	
	unsigned int powerusage;
	
	unsigned long long eccCountsTotalSingle;
	
	unsigned long long eccCountsTotalDouble;
	
//	unsigned long long energyConsumption;
	
	nvmlMemory_t *memory = (nvmlMemory_t*)malloc(sizeof(nvmlMemory_t));
	
	unsigned long long singleBitErrorL1CacheCount;
	
	unsigned long long doubleBitErrorL1CacheCount;
	
	unsigned long long singleBitErrorL2CacheCount;
	
	unsigned long long doubleBitErrorL2CacheCount;
	
	unsigned long long singleBitErrorDeviceMemoryCount;
	
	unsigned long long doubleBitErrorDeviceMemoryCount;
	
	unsigned long long singleBitErrorRegisterFileCount;
	
	unsigned long long doubleBitErrorRegisterFileCount;
	
	unsigned long long singleBitErrorTextureMemoryCount;
	
	unsigned long long doubleBitErrorTextureMemoryCount;
	
	unsigned long long singleBitErrorTextureShmCount;
	
	unsigned long long doubleBitErrorTextureShmCount;
	
	unsigned long long singleBitErrorCBUCount;
	
	unsigned long long doubleBitErrorCBUCount;
	
	nvmlUtilization_t *deviceUtilization = (nvmlUtilization_t*)malloc(sizeof(nvmlUtilization_t));
	
	nvmlProcessInfo_t *infos = (nvmlProcessInfo_t*)malloc(sizeof(nvmlProcessInfo_t));
	
	nvmlBAR1Memory_t *bar1Memory = (nvmlBAR1Memory_t*)malloc(sizeof(nvmlBAR1Memory_t));
	


// For Test

    printf("the clock count is %d.\n",NVML_CLOCK_COUNT);
    printf("the graphics clock is %d.\n",NVML_CLOCK_GRAPHICS);
    printf("the SM clock is %d.\n",NVML_CLOCK_SM);
    printf("the Memory clock is %d.\n",NVML_CLOCK_MEM);
   // printf("the Video clock is %d.\n",NVML_CLOCK_VIDEO);    
//  For getDevicehandle()

    if (getDevicehandle(&device) == 0){
        printf("get device handle success.\n");
		nvmlDeviceGetName(device,devicename,length);
		printf("the name of device 0 is %s.\n",devicename);
	} else {
	    printf("get device handle error.\n");
	    return 1;
	}

//  For getCurrPcieLinkWidth()

    if(getCurrPcieLinkWidth(device, &linkwid) == 0){
		printf("current pcie link width is %u.\n",linkwid);
	} else {
		printf("get current pcie link width err.\n");

	}

//  For getPcieThroughput()
 //not support
 /*   
	if(getPcieThroughput(device, &pciethroughput) == 0){
		printf("the pcie throughput is %u.\n", pciethroughput);
	} else {
		printf("get pcie throughput error.\n");

	}
*/
//For getPcieReplayCounter()

    if(getPcieReplayCounter(device, &pcieReplayCount) == 0){
	    printf("the pcie replay counter is %u.\n",pcieReplayCount);
	} else {
	    printf("get pcie replay counter error.\n");
	}

//For getFanSpeed()
//not support
/*
    if(getFanSpeed(device, &fanspeed) == 0){
		printf("the fan speed is %u.\n", fanspeed);
	} else {
		printf("get fan speed error.\n");
	}
*/
//For getPowerUsage()

    if(getPowerUsage(device, &powerusage) == 0){
	    printf("the power usage is %u.\n", powerusage);
	} else {
	    printf("get power usage error.\n");
	}

//For getTotalEnergyConsumption()
//volta or newer
/*
    if(getTotalEnergyConsumption(device, &energyConsumption) == 0){
	    printf("the total energy consumption is %lld.\n", energyConsumption);
	} else {
	    printf("get total energy consumption error.\n");
	}
*/

//For getMemoryInfo()
    if(getMemoryInfo(device, memory) == 0){
	    printf("the total memory is %lld.\n", memory->total);
		printf("the free memory is %lld.\n", memory->free);
		printf("the used memory is %lld.\n", memory->used);
    
    } else {
	    printf("get memory info error.\n");
	}


//For getTotalSingleBitEccErrors()
    if(getTotalSingleBitEccErrors(device, &eccCountsTotalSingle) == 0){
	    printf("the number of total single bit ecc error is %lld.\n", eccCountsTotalSingle);
	} else {
	    printf("get total single bit ecc error failed.\n");
	}



//For getTotalDoubleBitEccErrors()
    if(getTotalDoubleBitEccErrors(device, &eccCountsTotalDouble) == 0){
	    printf("the number of total double bit ecc error is %lld.\n", eccCountsTotalDouble);
	} else {
	    printf("get total double bit ecc error failed.\n");
	}



//For getMemorySingleBitErrorCounterL1Cache()
    if(getMemorySingleBitErrorCounterL1Cache(device, &singleBitErrorL1CacheCount) == 0){
	    printf("the number of single bit ecc error in L1 Cache is %lld.\n", singleBitErrorL1CacheCount);
		
	} else {
	    printf("get single bit ecc error in L1 Cache failed.\n");
	}


//For getMemoryDoubleBitErrorCounterL1Cache()
    if(getMemoryDoubleBitErrorCounterL1Cache(device, &doubleBitErrorL1CacheCount) == 0){
	    printf("the number of double bit ecc error in L1 Cache is %lld.\n", eccCountsTotalDouble);
	} else {
	    printf("get double bit ecc error in L1 Cache failed.\n");
	}

//For getMemorySingleBitErrorCounterL2Cache()
    if(getMemorySingleBitErrorCounterL2Cache(device, &singleBitErrorL2CacheCount) == 0){
	    printf("the number of single bit ecc error in L2 Cache is %lld.\n", singleBitErrorL2CacheCount);
	} else {
	    printf("get single bit ecc error in L2 Cache failed.\n");
	}

//For getMemoryDoubleBitErrorCounterL2Cache()
    if(getMemoryDoubleBitErrorCounterL2Cache(device, &doubleBitErrorL2CacheCount) == 0){
	    printf("the number of double bit ecc error in L2 Cache is %lld.\n", doubleBitErrorL2CacheCount);
	} else {
	    printf("get double bit ecc error in L2 Cache failed.\n");
	}

//For getMemorySingleBitErrorCounterDeviceMemory()
    if(getMemorySingleBitErrorCounterDeviceMemory(device, &singleBitErrorDeviceMemoryCount) == 0){
	    printf("the number of single bit ecc error in Device Memory is %lld.\n", singleBitErrorDeviceMemoryCount);
	} else {
	    printf("get single bit ecc error in Device Memory failed.\n");
	}

//For getMemoryDoubleBitErrorCounterDeviceMemory()
    if(getMemoryDoubleBitErrorCounterDeviceMemory(device, &doubleBitErrorDeviceMemoryCount) == 0){
	    printf("the number of double bit ecc error in Device Memory is %lld.\n", doubleBitErrorDeviceMemoryCount);
	} else {
	    printf("get double bit ecc error in Device Memory failed.\n");
	}

//For getMemorySingleBitErrorCounterRegisterFile()
    if(getMemorySingleBitErrorCounterRegisterFile(device, &singleBitErrorRegisterFileCount) == 0){
	    printf("the number of single bit ecc error in Register File is %lld.\n", singleBitErrorRegisterFileCount);
	} else {
	    printf("get single bit ecc error in Register File failed.\n");
	}

//For getMemoryDoubleBitErrorCounterRegisterFile()
    if(getMemoryDoubleBitErrorCounterRegisterFile(device, &doubleBitErrorRegisterFileCount) == 0){
	    printf("the number of double bit ecc error in Register File is %lld.\n", doubleBitErrorRegisterFileCount);
	} else {
	    printf("get double bit ecc error in Register File failed.\n");
	}

//For getMemorySingleBitErrorCounterTextureMemory()
    if(getMemorySingleBitErrorCounterTextureMemory(device, &singleBitErrorTextureMemoryCount) == 0){
	    printf("the number of single bit ecc error in Texture Memory is %lld.\n", singleBitErrorTextureMemoryCount);
	} else {
	    printf("get single bit ecc error in Texture Memory failed.\n");
	}

//For getMemoryDoubleBitErrorCounterTextureMemory()
    if(getMemoryDoubleBitErrorCounterTextureMemory(device, &doubleBitErrorTextureMemoryCount) == 0){
	    printf("the number of double bit ecc error in Texture Memory is %lld.\n", doubleBitErrorTextureMemoryCount);
	} else {
	    printf("get double bit ecc error in Texture Memory failed.\n");
	}

//For getMemorySingleBitErrorCounterTextureShm()
// not support
/*
    if(getMemorySingleBitErrorCounterTextureShm(device, &singleBitErrorTextureShmCount) == 0){
	    printf("the number of single bit ecc error in Shared memory is %lld.\n", singleBitErrorTextureShmCount);
	} else {
	    printf("get single bit ecc error in Shared memory failed.\n");
	}

//For getMemoryDoubleBitErrorCounterTextureShm()
    if(getMemoryDoubleBitErrorCounterTextureShm(device, &doubleBitErrorTextureShmCount) == 0){
	    printf("the number of double bit ecc error in Shared memory is %lld.\n", doubleBitErrorTextureShmCount);
	} else {
	    printf("get double bit ecc error in Shared memory failed.\n");
	}

//For getMemorySingleBitErrorCounterCBU()
    if(getMemorySingleBitErrorCounterCBU(device, &singleBitErrorCBUCount) == 0){
	    printf("the number of single bit ecc error in CBU is %lld.\n", singleBitErrorCBUCount);
	} else {
	    printf("get single bit ecc error in CBU failed.\n");
	}

//For getMemoryDoubleBitErrorCounterCBU()
    if(getMemoryDoubleBitErrorCounterCBU(device, &doubleBitErrorCBUCount) == 0){
	    printf("the number of double bit ecc error in CBU is %lld.\n", doubleBitErrorCBUCount);
	} else {
	    printf("get double bit ecc error in CBU failed.\n");
	}
*/


//int getUtilizationRates()
    if(getUtilizationRates(device, deviceUtilization) == 0){
	    printf("the Utilization of GPU is %u.\n", deviceUtilization->gpu);
	    printf("the Utilization of Memory is %u.\n", deviceUtilization->memory);
	} else {
	    printf("get device's UtilizationRate failed.\n");
	}


//int getEncoderUtilization()




//int getDecoderUtilization()


//int getComputeRunningProcesses()
    if(getComputeRunningProcesses(device, infos) == 0){
	    printf("Process ID is %u.\n", infos->pid);
		printf("used Gpu Memory is %lld.\n",infos->usedGpuMemory);
	} else {
	    printf("get Compute Running Processes failed.\n");
	}



//int getBAR1MemoryInfo()
    if(getBAR1MemoryInfo(device, bar1Memory) == 0){
	    printf("bar1 total memory is %lld.\n", bar1Memory->bar1Total);
		printf("bar1 free memory is %lld.\n", bar1Memory->bar1Free);
		printf("bar1 used memory is %lld.\n", bar1Memory->bar1Used);
	} else {
	    printf("get bar1 memory infos failed.\n");
	}


//int getViolationStatus()

//shutdown
    if(shutdown() == 0){
		printf("nvml shutdown succ.\n");
	} else {
		printf("nvml shutdown err.\n");
		return 1;
	}
	
// free
   free(devicename);
   free(memory);
   free(deviceUtilization);
   free(infos);
   free(bar1Memory);
return 0;	

}



