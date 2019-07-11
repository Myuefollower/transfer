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
	
	unsigned int maxLinkGen;
	
	unsigned int maxLinkWidth;
	
	unsigned int currLinkGen;
	
	unsigned int currLinkWidth;

    unsigned int pciethroughput;	
	
	unsigned int pcieReplayCount;
	
	
	unsigned int currSmClock;
	
	unsigned int currMemClock;
	
	unsigned int smclockMHz;
	
	unsigned int memclockMHz;
	
	unsigned int maxSmClock;
	
	unsigned int maxMemClock;
	
	
	unsigned int currsmclo;
	
	unsigned int currmemclo;
	
	unsigned int appsmclo;
	
	unsigned int appmemclo;
	
	unsigned int defsmclo;
	
	unsigned int defmemclo;
	
	
	
	unsigned int temp;
	
	unsigned int fanspeed;
	
	unsigned int powerusage;
	
	
	
	unsigned long long volatileEccCountsTotalSingle;
	unsigned long long aggregateEccCountsTotalSingle;
	
	unsigned long long volatileEccCountsTotalDouble;
	unsigned long long aggregateEccCountsTotalDouble;
	
//	unsigned long long energyConsumption;
	
	nvmlMemory_t *memory = (nvmlMemory_t*)malloc(sizeof(nvmlMemory_t));
	
	nvmlPstates_t *perState = (nvmlPstates_t*)mallco(sizeof(nvmlPstates_t));
	
	int perforState;
	
	nvmlPstates_t *powState = (nvmlPstates_t*)mallco(sizeof(nvmlPstates_t));
	
	int powerState;
	
	unsigned long long volatileSingleBitErrorL1CacheCount;
	unsigned long long aggregateSingleBitErrorL1CacheCount;
	
	unsigned long long volatileDoubleBitErrorL1CacheCount;
	unsigned long long aggregateDoubleBitErrorL1CacheCount;
	
	unsigned long long volatileSingleBitErrorL2CacheCount;
	unsigned long long aggregateSingleBitErrorL2CacheCount;
	
	unsigned long long volatileDoubleBitErrorL2CacheCount;
	unsigned long long aggregateDoubleBitErrorL2CacheCount;
	
	unsigned long long volatileSingleBitErrorDeviceMemoryCount;
	unsigned long long aggregateSingleBitErrorDeviceMemoryCount;
	
	unsigned long long volatileDoubleBitErrorDeviceMemoryCount;
	unsigned long long aggregateDoubleBitErrorDeviceMemoryCount;
	
	unsigned long long volatileSingleBitErrorRegisterFileCount;
	unsigned long long aggregateSingleBitErrorRegisterFileCount;
	
	unsigned long long volatileDoubleBitErrorRegisterFileCount;
	unsigned long long aggregateDoubleBitErrorRegisterFileCount;
	
	unsigned long long volatileSingleBitErrorTextureMemoryCount;
	unsigned long long aggregateSingleBitErrorTextureMemoryCount;
	
	unsigned long long volatileDoubleBitErrorTextureMemoryCount;
	unsigned long long aggregateDoubleBitErrorTextureMemoryCount;
	
	//unsigned long long volatileSingleBitErrorTextureShmCount;
	//unsigned long long aggregateSingleBitErrorTextureShmCount;
	
	//unsigned long long volatileDoubleBitErrorTextureShmCount;
	//unsigned long long aggregateDoubleBitErrorTextureShmCount;
	
	//unsigned long long volatileSingleBitErrorCBUCount;
	//unsigned long long aggregateSingleBitErrorCBUCount;
	
	//unsigned long long volatileDoubleBitErrorCBUCount;
	//unsigned long long aggregateDoubleBitErrorCBUCount;
	
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
	
//For getMaxPcieLinkGeneration
    if(getMaxPcieLinkGeneration(device, &maxLinkGen) == 0){
	    printf("max pcie link generation is %u.\n", maxLinkGen);
	} else {
	    printf("get max pcie link generation err.\n");
	}
	
//For getMaxPcieLinkWidth
    if(getMaxPcieLinkWidth(device, &maxLinkWidth) == 0){
	    printf("max pcie link width is %u.\n", maxLinkWidth);
	} else {
	    printf("get max pcie link width err.\n");
	}

//For getCurrPcieLinkGeneration
    if(getCurrPcieLinkGeneration(device, &currLinkGen) == 0){
	    printf("current pcie link generation is %u.\n", currLinkGen);
	} else {
	
	}

//  For getCurrPcieLinkWidth()
    if(getCurrPcieLinkWidth(device, &currLinkWidth) == 0){
		printf("current pcie link width is %u.\n",currLinkWidth);
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
	    printf("the pcie replay counter is %u.\n", pcieReplayCount);
	} else {
	    printf("get pcie replay counter error.\n");
	}



//For getCurrSMClockInfo
    if(getCurrSMClockInfo(device, &currSmClock) == 0){
	    printf("the current SM clock speed is %u.\n", currSmClock);
	} else {
	    printf("get current SM clock speed error.\n");
	}

//For getCurrMEMClockInfo
    if (getCurrMEMClockInfo(device, &currMemClock) == 0){
	    printf("the current MEM clock speed is %u.\n", currMemClock);
	} else {
	    printf("get current MEM clock speed error.\n");
	}

//For getSMApplicationsClock
    if(getSMApplicationsClock(device, &smclockMHz) == 0){
	    printf("the application SM clock is %u.\n", smclockMHz);
	} else {
	    printf("get application SM clock error.\n");
	}

//For GetMEMApplicationsClock
    if(GetMEMApplicationsClock(device, &memclockMHz) == 0){
	    printf("the application MEM clock is %u.\n", memclockMHz);
	} else {
	    printf("get application MEM clock error.\n");
	}

//For getMaxSMClockInfo
    if(getMaxSMClockInfo(device, &maxSmClock) == 0){
	    printf("the max SM clock speed is %u.\n", maxSmClock);
	} else {
	    printf("get max SM clock speed error.\n");
	}

//For getMaxMEMClockInfo
    if (getMaxMEMClockInfo(device, &maxMemClock) == 0){
	    printf("the max MEM clock speed is %u.\n", maxMemClock);
	} else {
	    printf("get max MEM clock speed error.\n");
	}


//
    if(getCurrSMClock(device, &currsmclo) == 0){
	    printf("the current SM clock speed is %u.\n", currsmclo);
	} else {
	    printf("get the current SM clock speed error.\n");
	}

//
    if(getCurrMEMClock(device, &currmemclo) ==0){
	    printf("the current MEM clock speed is %u.\n", currmemclo);
	} else {
	    printf("get the current MEM clock speed error.\n");
	}

//
    if(getAppSMClock(device, &appsmclo) == 0){
	    printf("the application SM clock speed is %u.\n", appsmclo);
	} else {
	    printf("get the application SM clock speed error.\n");
	}

//
    if(getAppMEMClock(device, &appmemclo) == 0){
	    printf("the application MEM clock speed is %u.\n", appmemclo);
	} else {
	    printf("get the application MEM clock speed error.\n");
	}

//
    if (getDefSMClock(device, &defsmclo) == 0){
	    printf("the default SM clock speed is %u.\n", defsmclo);
	} else {
	    printf("get the default SM clock speed error.\n");
	}

//
    if(getDefMEMClock(device, &defmemclo) == 0){
	    printf("the default MEM clock speed is %u.\n", defmemclo);
	} else {
	    printf("get the default MEM clock speed error.\n");
	}


//For getTemperature
    if(getTemperature(device, &temp) == 0){
	    printf("the GPU temperature is %u.\n", temp);
	} else {
	    printf("get the GPU temperature error.\n");
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


//For getPerformanceState
    if(getPerformanceState(device, perState, perforState) == 0){
	    printf("the performance state is %d.\n",perforState);
	} else {
	    printf("get the performance state error.\n");
	}

//For getPowerState
    if(getPowerState(device, powState, powerState) == 0){
	    printf("the power state is %d.\n",powerState);
	} else {
	    printf("get the power state error.\n");
	}




//For getTotalVolatileSingleBitEccErrors()
    if(getTotalVolatileSingleBitEccErrors(device, &volatileEccCountsTotalSingle) == 0){
	    printf("the number of volatile total single bit ecc error is %lld.\n", volatileEccCountsTotalSingle);
	} else {
	    printf("get volatile total single bit ecc error failed.\n");
	}

//For getTotalAggregateSingleBitEccErrors()
    if(getTotalAggregateSingleBitEccErrors(device, &aggregateEccCountsTotalSingle) == 0){
	    printf("the number of aggregate total single bit ecc error is %lld.\n", aggregateEccCountsTotalSingle);
	} else {
	    printf("get aggregate total single bit ecc error failed.\n");
	}

//For getTotalVolatileDoubleBitEccErrors()
    if(getTotalVolatileDoubleBitEccErrors(device, &volatileEccCountsTotalDouble) == 0){
	    printf("the number of volatile total double bit ecc error is %lld.\n", volatileEccCountsTotalDouble);
	} else {
	    printf("get volatile total double bit ecc error failed.\n");
	}

//For getTotalAggregateDoubleBitEccErrors()
    if(getTotalAggregateDoubleBitEccErrors(device, &aggregateEccCountsTotalDouble) == 0){
	    printf("the number of aggregate total double bit ecc error is %lld.\n", aggregateEccCountsTotalDouble);
	} else {
	    printf("get aggregate total double bit ecc error failed.\n");
	}

//For getMemoryVolatileSingleBitErrorCounterL1Cache()
    if(getMemoryVolatileSingleBitErrorCounterL1Cache(device, &volatileSingleBitErrorL1CacheCount) == 0){
	    printf("the number of volatile single bit ecc error in L1 Cache is %lld.\n", volatileSingleBitErrorL1CacheCount);
	} else {
	    printf("get volatile single bit ecc error in L1 Cache failed.\n");
	}
	
//For getMemoryAggregateSingleBitErrorCounterL1Cache()
    if(getMemoryAggregateSingleBitErrorCounterL1Cache(device, &aggregateSingleBitErrorL1CacheCount) == 0){
	    printf("the number of aggregate single bit ecc error in L1 Cache is %lld.\n", aggregateSingleBitErrorL1CacheCount);
		
	} else {
	    printf("get aggregate single bit ecc error in L1 Cache failed.\n");
	}

//For getMemoryVolatileDoubleBitErrorCounterL1Cache()
    if(getMemoryVolatileDoubleBitErrorCounterL1Cache(device, &volatileDoubleBitErrorL1CacheCount) == 0){
	    printf("the number of volatile double bit ecc error in L1 Cache is %lld.\n", volatileDoubleBitErrorL1CacheCount);
	} else {
	    printf("get volatile double bit ecc error in L1 Cache failed.\n");
	}

//For getMemoryAggregateDoubleBitErrorCounterL1Cache()
    if(getMemoryAggregateDoubleBitErrorCounterL1Cache(device, &aggregateDoubleBitErrorL1CacheCount) == 0){
	    printf("the number of aggregate double bit ecc error in L1 Cache is %lld.\n", aggregateDoubleBitErrorL1CacheCount);
	} else {
	    printf("get aggregate double bit ecc error in L1 Cache failed.\n");
	}
	
//For getMemoryVolatileSingleBitErrorCounterL2Cache()
    if(getMemoryVolatileSingleBitErrorCounterL2Cache(device, &volatileSingleBitErrorL2CacheCount) == 0){
	    printf("the number of volatile single bit ecc error in L2 Cache is %lld.\n", volatileSingleBitErrorL2CacheCount);
	} else {
	    printf("get volatile single bit ecc error in L2 Cache failed.\n");
	}
	
//For getMemoryAggregateSingleBitErrorCounterL2Cache()
    if(getMemoryAggregateSingleBitErrorCounterL2Cache(device, &aggregateSingleBitErrorL2CacheCount) == 0){
	    printf("the aggregate number of single bit ecc error in L2 Cache is %lld.\n", aggregateSingleBitErrorL2CacheCount);
	} else {
	    printf("get aggregate single bit ecc error in L2 Cache failed.\n");
	}
	
//For getMemoryVolatileDoubleBitErrorCounterL2Cache()
    if(getMemoryVolatileDoubleBitErrorCounterL2Cache(device, &volatileDoubleBitErrorL2CacheCount) == 0){
	    printf("the number of volatile double bit ecc error in L2 Cache is %lld.\n", volatileDoubleBitErrorL2CacheCount);
	} else {
	    printf("get volatile double bit ecc error in L2 Cache failed.\n");
	}
	
//For getMemoryAggregateDoubleBitErrorCounterL2Cache()
    if(getMemoryAggregateDoubleBitErrorCounterL2Cache(device, &aggregateDoubleBitErrorL2CacheCount) == 0){
	    printf("the number of aggregate double bit ecc error in L2 Cache is %lld.\n", aggregateDoubleBitErrorL2CacheCount);
	} else {
	    printf("get aggregate double bit ecc error in L2 Cache failed.\n");
	}
	
//For getMemoryVolatileSingleBitErrorCounterDeviceMemory()
    if(getMemoryVolatileSingleBitErrorCounterDeviceMemory(device, &volatileSingleBitErrorDeviceMemoryCount) == 0){
	    printf("the number of volatile single bit ecc error in Device Memory is %lld.\n", volatileSingleBitErrorDeviceMemoryCount);
	} else {
	    printf("get volatile single bit ecc error in Device Memory failed.\n");
	}
//For getMemoryAggregateSingleBitErrorCounterDeviceMemory()
    if(getMemoryAggregateSingleBitErrorCounterDeviceMemory(device, &aggregateSingleBitErrorDeviceMemoryCount) == 0){
	    printf("the number of aggregate single bit ecc error in Device Memory is %lld.\n", aggregateSingleBitErrorDeviceMemoryCount);
	} else {
	    printf("get aggregate single bit ecc error in Device Memory failed.\n");
	}
	
//For getMemoryVolatileDoubleBitErrorCounterDeviceMemory()
    if(getMemoryVolatileDoubleBitErrorCounterDeviceMemory(device, &volatileDoubleBitErrorDeviceMemoryCount) == 0){
	    printf("the number of volatile double bit ecc error in Device Memory is %lld.\n", volatileDoubleBitErrorDeviceMemoryCount);
	} else {
	    printf("get volatile double bit ecc error in Device Memory failed.\n");
	}
//For getMemoryAggregateDoubleBitErrorCounterDeviceMemory()
    if(getMemoryAggregateDoubleBitErrorCounterDeviceMemory(device, &aggregateDoubleBitErrorDeviceMemoryCount) == 0){
	    printf("the number of aggregate double bit ecc error in Device Memory is %lld.\n", aggregateDoubleBitErrorDeviceMemoryCount);
	} else {
	    printf("get aggregate double bit ecc error in Device Memory failed.\n");
	}
	
//For getMemoryVolatileSingleBitErrorCounterRegisterFile()
    if(getMemoryVolatileSingleBitErrorCounterRegisterFile(device, &volatileSingleBitErrorRegisterFileCount) == 0){
	    printf("the number of volatile single bit ecc error in Register File is %lld.\n", volatileSingleBitErrorRegisterFileCount);
	} else {
	    printf("get volatile single bit ecc error in Register File failed.\n");
	}
//For getMemoryAggregateSingleBitErrorCounterRegisterFile()
    if(getMemoryAggregateSingleBitErrorCounterRegisterFile(device, &aggregateSingleBitErrorRegisterFileCount) == 0){
	    printf("the number of aggregate single bit ecc error in Register File is %lld.\n", aggregateSingleBitErrorRegisterFileCount);
	} else {
	    printf("get aggregate single bit ecc error in Register File failed.\n");
	}
	
//For getMemoryVolatileDoubleBitErrorCounterRegisterFile()
    if(getMemoryVolatileDoubleBitErrorCounterRegisterFile(device, &volatileDoubleBitErrorRegisterFileCount) == 0){
	    printf("the number of volatile double bit ecc error in Register File is %lld.\n", volatileDoubleBitErrorRegisterFileCount);
	} else {
	    printf("get volatile double bit ecc error in Register File failed.\n");
	}

//For getMemoryAggregateDoubleBitErrorCounterRegisterFile()
    if(getMemoryAggregateDoubleBitErrorCounterRegisterFile(device, &aggregateDoubleBitErrorRegisterFileCount) == 0){
	    printf("the number of aggregate double bit ecc error in Register File is %lld.\n", aggregateDoubleBitErrorRegisterFileCount);
	} else {
	    printf("get aggregate double bit ecc error in Register File failed.\n");
	}
	
//For getMemoryVolatileSingleBitErrorCounterTextureMemory()
    if(getMemoryVolatileSingleBitErrorCounterTextureMemory(device, &volatileSingleBitErrorTextureMemoryCount) == 0){
	    printf("the number of volatile single bit ecc error in Texture Memory is %lld.\n", volatileSingleBitErrorTextureMemoryCount);
	} else {
	    printf("get volatile single bit ecc error in Texture Memory failed.\n");
	}
	
//For getMemoryAggregateSingleBitErrorCounterTextureMemory()
    if(getMemoryAggregateSingleBitErrorCounterTextureMemory(device, &aggregateSingleBitErrorTextureMemoryCount) == 0){
	    printf("the number of aggregate single bit ecc error in Texture Memory is %lld.\n", aggregateSingleBitErrorTextureMemoryCount);
	} else {
	    printf("get aggregate single bit ecc error in Texture Memory failed.\n");
	}
	
//For getMemoryVolatileDoubleBitErrorCounterTextureMemory()
    if(getMemoryVolatileDoubleBitErrorCounterTextureMemory(device, &volatileDoubleBitErrorTextureMemoryCount) == 0){
	    printf("the number of volatile double bit ecc error in Texture Memory is %lld.\n", volatileDoubleBitErrorTextureMemoryCount);
	} else {
	    printf("get volatile double bit ecc error in Texture Memory failed.\n");
	}
	
//For getMemoryAggregateDoubleBitErrorCounterTextureMemory()
    if(getMemoryAggregateDoubleBitErrorCounterTextureMemory(device, &aggregateDoubleBitErrorTextureMemoryCount) == 0){
	    printf("the number of aggregate double bit ecc error in Texture Memory is %lld.\n", aggregateDoubleBitErrorTextureMemoryCount);
	} else {
	    printf("get aggregate double bit ecc error in Texture Memory failed.\n");
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
   free(perState);
   free(powState);
   free(deviceUtilization);
   free(infos);
   free(bar1Memory);
return 0;	

}



