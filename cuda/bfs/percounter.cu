#include <stdio.h>
#include <stdlib.h>
#include <nvml.h>

int init(){
	if(nvmlInit() == NVML_SUCCESS){
		return 0;
	} else {
		return 1;
	}


}

int shutdown(){
	if(nvmlShutdown() == NVML_SUCCESS){
		return 0;
	} else {
		return 1;
	}

}

int handleReturnValue(nvmlReturn_t returnValue){
    if(returnValue == NVML_SUCCESS){
		printf("success.\n");
		return 0;
	} else if(returnValue == NVML_ERROR_UNINITIALIZED){
		printf("error, the library has not been successfully initialized.\n");
		return 1;
	} else if(returnValue == NVML_ERROR_INVALID_ARGUMENT){
		printf("error,device or counter is invalid,or value is NULL.\n");
		return 1;
	} else if(returnValue == NVML_ERROR_NOT_SUPPORTED){
		printf("error,the device does not support this feature.\n");
		return 1;
	} else if(returnValue == NVML_ERROR_GPU_IS_LOST){
		printf("error, the target GPU has fallen off the bus or is otherwise inaccessible.\n");
		return 1;
	} else {
		printf("error unknown.\n");
		return 1;

	}

}

int getDevicehandle(nvmlDevice_t *device){
	unsigned int index = 0;
	if(nvmlDeviceGetHandleByIndex(index,device) == NVML_SUCCESS){
		return 0;
	} else {
		return 1;
	}

}

int getCurrPcieLinkWidth(nvmlDevice_t device, unsigned int *currLinkWidth){
	if(nvmlDeviceGetCurrPcieLinkWidth(device, currLinkWidth) == NVML_SUCCESS) {
		return 0;
	} else {
		return 1;
	}

}


//The device does not support this feature.
/*
int getPcieThroughput(nvmlDevice_t device, unsigned int *value){
	nvmlPcieUtilCounter_t counter1 = NVML_PCIE_UTIL_TX_BYTES;
//  nvmlPcieUtilCounter_t counter2 = NVML_PCIE_UTIL_RX_BYTES;
//  nvmlPcieUtilCounter_t counter3 = NVML_PCIE_UTIL_COUNT;
	nvmlReturn_t returnv = nvmlDeviceGetPcieThroughput(device, counter1, value);
	return handleReturnValue(returnv);

}
*/

int getPcieReplayCounter(nvmlDevice_t device, unsigned int *value){
	nvmlReturn_t returnv = nvmlDeviceGetPcieReplayCounter(device, value);
	return handleReturnValue(returnv);

}

//not support
/*
int getFanSpeed(nvmlDevice_t device, unsigned int *speed){
	nvmlReturn_t returnv = nvmlDeviceGetFanSpeed(device, speed);
	return handleReturnValue(returnv);
}
*/
int getPowerUsage(nvmlDevice_t device, unsigned int *power){
    nvmlReturn_t returnv = nvmlDeviceGetPowerUsage(device, power);
	return handleReturnValue(returnv);

}

//For volta or newer
/*
int getTotalEnergyConsumption(nvmlDevice_t device, unsigned long long *energy){
    nvmlReturn_t returnValue = nvmlDeviceGetTotalEnergyConsumption(device, energy);
	return handleReturnValue(returnValue);
 
}
*/



int getMemoryInfo(nvmlDevice_t device, nvmlMemory_t *memory){
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryInfo(device, memory);
	return handleReturnValue(returnValue);

}



int getTotalSingleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts){
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
    nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
    nvmlReturn_t returnValue = nvmlDeviceGetTotalEccErrors(device, errorType, counterType, eccCounts);
    return handleReturnValue(returnValue);
	
}



int getTotalDoubleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts){
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
    nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
    nvmlReturn_t returnValue = nvmlDeviceGetTotalEccErrors(device, errorType, counterType, eccCounts);
	return handleReturnValue(returnValue);
}


int getMemorySingleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_L1_CACHE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
	return handleReturnValue(returnValue);

}


int getMemoryDoubleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_L1_CACHE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemorySingleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_L2_CACHE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryDoubleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_L2_CACHE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemorySingleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_DEVICE_MEMORY;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryDoubleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_DEVICE_MEMORY;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemorySingleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_REGISTER_FILE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryDoubleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_REGISTER_FILE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemorySingleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_TEXTURE_MEMORY;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryDoubleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_TEXTURE_MEMORY;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemorySingleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_TEXTURE_SHM;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryDoubleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_TEXTURE_SHM;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemorySingleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_CBU;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryDoubleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_CBU;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getUtilizationRates(nvmlDevice_t device, nvmlUtilization_t *utilization){
    nvmlReturn_t returnValue = nvmlDeviceGetUtilizationRates(device, utilization);
    return handleReturnValue(returnValue);

}


int getEncoderUtilization(nvmlDevice_t device, unsigned int *utilization, unsigned int *samplingPeriodUs){
    nvmlReturn_t returnValue = nvmlDeviceGetEncoderUtilization(device, utilization, samplingPeriodUs);
    return handleReturnValue(returnValue);

}

//Maxwell or newer
/*
int GetEncoderCapacity(nvmlDevice_t device, unsigned int *encoderCapacity){

    //NVML_ENCODER_QUERY_H264 = 0
	//NVML_ENCODER_QUERY_HEVC = 1
    nvmlEncoderType_t encoderQueryType = NVML_ENCODER_QUERY_H264;
    nvmlReturn_t returnValue = nvmlDeviceGetEncoderUtilization(device, encoderQueryType, encoderCapacity);
    return handleReturnValue(returnValue);

}
*/

//Maxwell or newer
/*
int getEncoderStats(nvmlDevice_t device, unsigned int *sessionCount, unsigned int *averageFps, unsigned int *averageLatency){
    nvmlReturn_t returnValue = nvmlDeviceGetEncoderStats(device, sessionCount, averageFps, averageLatency);
    return handleReturnValue(returnValue);

}
*/


int getDecoderUtilization(nvmlDevice_t device, unsigned int *utilization, unsigned int *samplingPeriodUs){

    nvmlReturn_t returnValue = nvmlDeviceGetDecoderUtilization(device, utilization, samplingPeriodUs);
    return handleReturnValue(returnValue);

}

//Maxwell or newer
/*
int getFBCStats(nvmlDevice_t device, nvmlFBCStats_t *fbcStats){
    nvmlReturn_t returnValue = nvmlDeviceGetFBCStats(device, fbcStats);
    return handleReturnValue(returnValue);

}
*/

int getComputeRunningProcesses(nvmlDevice_t device, nvmlProcessInfo_t *infos){
    unsigned int infoCount = 1;
    nvmlReturn_t returnValue = nvmlDeviceGetComputeRunningProcesses(device, &infoCount, infos);
    return handleReturnValue(returnValue);

}


int getBAR1MemoryInfo(nvmlDevice_t device, nvmlBAR1Memory_t *bar1Memory){
    nvmlReturn_t returnValue = nvmlDeviceGetBAR1MemoryInfo(device, bar1Memory);
    return handleReturnValue(returnValue);

}


int getViolationStatus(nvmlDevice_t device, nvmlPerfPolicyType_t perfPolicyType, nvmlViolationTime_t *violTime){
    nvmlReturn_t returnValue = nvmlDeviceGetViolationStatus(device, perfPolicyType, violTime);
    return handleReturnValue(returnValue);

}
//Pascal or newer
/*
int getNvLinkErrorCounterReplay(nvmlDevice_t device, unsigned int link, unsigned long long *counterValue){

    nvmlNvLinkErrorCounter_t counter = NVML_NVLINK_ERROR_DL_REPLAY;
    nvmlReturn_t returnValue = nvmlDeviceGetNvLinkErrorCounter(device, link, counter, counterValue);
    return handleReturnValue(returnValue);
}


int getNvLinkErrorCounterRecovery(nvmlDevice_t device, unsigned int link, unsigned long long *counterValue){
    nvmlNvLinkErrorCounter_t counter = NVML_NVLINK_ERROR_DL_RECOVERY;
    nvmlReturn_t returnValue = nvmlDeviceGetNvLinkErrorCounter(device, link, counter, counterValue);
    return handleReturnValue(returnValue);


}


int getNvLinkErrorCounterCRCFlit(nvmlDevice_t device, unsigned int link, unsigned long long *counterValue){
    nvmlNvLinkErrorCounter_t counter = NVML_NVLINK_ERROR_DL_CRC_FLIT;
    nvmlReturn_t returnValue = nvmlDeviceGetNvLinkErrorCounter(device, link, counter, counterValue);
    return handleReturnValue(returnValue);

}


int getNvLinkErrorCounterCRCData(nvmlDevice_t device, unsigned int link, unsigned long long *counterValue){
    nvmlNvLinkErrorCounter_t counter = NVML_NVLINK_ERROR_DL_CRC_DATA;
    nvmlReturn_t returnValue = nvmlDeviceGetNvLinkErrorCounter(device, link, counter, counterValue);
    return handleReturnValue(returnValue);

}

int getNvLinkUtilizationCounter(nvmlDevice_t device, unsigned int link, unsigned int counter, unsigned long long *rxcounter, unsigned long long *txcounter){
    nvmlReturn_t returnValue = nvmlDeviceGetNvLinkUtilizationCounter(device, link, counter, rxcounter, txcounter);
    return handleReturnValue(returnValue);


}
*/

/*
int getSupportedVgpus(nvmlDevice_t device, unsigned int *vgpuCount, nvmlVgpuTypeId_t *vgpuTypeIds){
    nvmlReturn_t returnValue = nvmlDeviceGetSupportedVgpus(device, vgpuCount, vgpuTypeIds);
    return handleReturnValue(returnValue);
}


int getActiveVgpus(nvmlDevice_t device, unsigned int *vgpuCount, nvmlVgpuInstance_t *vgpuInstances){
    nvmlReturn_t returnValue = nvmlDeviceGetActiveVgpus (device, vgpuCount, vgpuInstances);
    return handleReturnValue(returnValue);

}

int vgpuInstanceGetEncoderCapacity(nvmlVgpuInstance_t vgpuInstance, unsigned int *encoderCapacity){
    nvmlReturn_t returnValue = nvmlVgpuInstanceGetEncoderCapacity(vgpuInstance, encoderCapacity);
    return handleReturnValue(returnValue);

}


int getVgpuUtilization(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlValueType_t *sampleValType, unsigned int *vgpuInstanceSamplesCount, nvmlVgpuInstanceUtilizationSample_t *utilizationSamples){
    nvmlReturn_t returnValue = nvmlDeviceGetVgpuUtilization(device, lastSeenTimeStamp, sampleValType, vgpuInstanceSamplesCount, utilizationSamples);
    return handleReturnValue(returnValue);
}


int getVgpuProcessUtilization(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, unsigned int *vgpuProcessSamplesCount, nvmlVgpuProcessUtilizationSample_t *utilizationSamples){
    nvmlReturn_t returnValue = nvmlDeviceGetVgpuProcessUtilization(device, lastSeenTimeStamp, vgpuProcessSamplesCount, utilizationSamples);
    return handleReturnValue(returnValue);
}

int vgpuInstanceGetEncoderStats(nvmlVgpuInstance_t vgpuInstance, unsigned int *sessionCount, unsigned int *averageFps, unsigned int *averageLatency){
    nvmlReturn_t returnValue = nvmlVgpuInstanceGetEncoderStats(vgpuInstance, sessionCount, averageFps, averageLatency);
    return handleReturnValue(returnValue);
}


int vgpuInstanceGetFBCStats(nvmlVgpuInstance_t vgpuInstance, nvmlFBCStats_t *fbcStats){
    nvmlReturn_t returnValue = nvmlVgpuInstanceGetFBCStats(vgpuInstance, fbcStats);
    return handleReturnValue(returnValue);

}
*/

//Maxwell or newer
/*
int getProcessUtilization(nvmlDevice_t device, nvmlProcessUtilizationSample_t *utilization, unsigned int *processSamplesCount, unsigned long long lastSeenTimeStamp){
    nvmlReturn_t returnValue = nvmlDeviceGetProcessUtilization(device, utilization, processSamplesCount, lastSeenTimeStamp);
    return handleReturnValue(returnValue);
}
*/





void collectNvmlData(FILE *datafp){

	//datafp = fopen("nvmlData.txt", "a+");


//init
/*
    if(init() == 0){
		fprintf(datafp, "%s\n", "nvml init succ.\n");
	} else {
		fprintf(datafp, "%s\n", "nvml init err.\n");
	}
*/
    
//For Variable and malloc
	unsigned int length = 100;
        nvmlDevice_t device;
	
	char *devicename = (char*)malloc(sizeof(char)*length);
	
	unsigned int linkwid;

       //unsigned int pciethroughput;	
	
	unsigned int pcieReplayCount;
	
	//unsigned int fanspeed;
	
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
	
	//unsigned long long singleBitErrorTextureShmCount;
	
	//unsigned long long doubleBitErrorTextureShmCount;
	
	//unsigned long long singleBitErrorCBUCount;
	
	//unsigned long long doubleBitErrorCBUCount;
	
	nvmlUtilization_t *deviceUtilization = (nvmlUtilization_t*)malloc(sizeof(nvmlUtilization_t));
	
	nvmlProcessInfo_t *infos = (nvmlProcessInfo_t*)malloc(sizeof(nvmlProcessInfo_t));
	
	nvmlBAR1Memory_t *bar1Memory = (nvmlBAR1Memory_t*)malloc(sizeof(nvmlBAR1Memory_t));
	


// For Test
   // fprintf(datafp, "%s\n", "nvml init err.\n");
   // For Example
    fprintf(datafp, "%s %d.\n", "the clock count is", NVML_CLOCK_COUNT);
    fprintf(datafp, "%s %d.\n", "the graphics clock is", NVML_CLOCK_GRAPHICS);
    fprintf(datafp, "%s %d.\n", "the SM clock is", NVML_CLOCK_SM);
    fprintf(datafp, "%s %d.\n", "the Memory clock is", NVML_CLOCK_MEM);
   // printf("the Video clock is %d.\n",NVML_CLOCK_VIDEO);    
//  For getDevicehandle()

    if (getDevicehandle(&device) == 0){
        fprintf(datafp, "%s.\n", "get device handle success");
		nvmlDeviceGetName(device,devicename,length);
		fprintf(datafp, "%s %s.\n", "the name of device 0 is", devicename);
	} else {
	    fprintf(datafp, "%s.\n", "get device handle error");
	    //return 1;
	}

//  For getCurrPcieLinkWidth()

    if(getCurrPcieLinkWidth(device, &linkwid) == 0){
		fprintf(datafp, "%s %u.\n", "current pcie link width is", linkwid);
	} else {
		fprintf(datafp, "%s.\n", "get current pcie link width err");
	}

//  For getPcieThroughput()
 //not support
 /*   
	if(getPcieThroughput(device, &pciethroughput) == 0){
		fprintf(datafp, "%s %u.\n", "the pcie throughput is", pciethroughput);
	} else {
		fprintf(datafp, "%s.\n", "get pcie throughput error");

	}
*/
//For getPcieReplayCounter()

    if(getPcieReplayCounter(device, &pcieReplayCount) == 0){
	    fprintf(datafp, "%s %u.\n", "the pcie replay counter is", pcieReplayCount);
	} else {
	    fprintf(datafp, "%s.\n", "get pcie replay counter error");
	}

//For getFanSpeed()
//not support
/*
    if(getFanSpeed(device, &fanspeed) == 0){
		fprintf("the fan speed is %u.\n", fanspeed);
	} else {
		fprintf("get fan speed error.\n");
	}
*/
//For getPowerUsage()

    if(getPowerUsage(device, &powerusage) == 0){
	    fprintf(datafp, "%s %u.\n", "the power usage is", powerusage);
	} else {
	    fprintf(datafp, "%s.\n", "get power usage error");
	}

//For getTotalEnergyConsumption()
//volta or newer
/*
    if(getTotalEnergyConsumption(device, &energyConsumption) == 0){
	    fprintf(datafp, "%s %lld.\n", "the total energy consumption is", energyConsumption);
	} else {
	    fprintf(datafp, "%s.\n", "get total energy consumption error");
	}
*/

//For getMemoryInfo()
    if(getMemoryInfo(device, memory) == 0){
	    fprintf(datafp, "%s %lld.\n", "the total memory is", memory->total);
		fprintf(datafp, "%s %lld.\n", "the free memory is", memory->free);
		fprintf(datafp, "%s %lld.\n", "the used memory is", memory->used);
    
    } else {
	    fprintf(datafp, "%s.\n", "get memory info error");
	}


//For getTotalSingleBitEccErrors()
    if(getTotalSingleBitEccErrors(device, &eccCountsTotalSingle) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of total single bit ecc error is", eccCountsTotalSingle);
	} else {
	    fprintf(datafp, "%s.\n", "get total single bit ecc error failed");
	}



//For getTotalDoubleBitEccErrors()
    if(getTotalDoubleBitEccErrors(device, &eccCountsTotalDouble) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of total double bit ecc error is", eccCountsTotalDouble);
	} else {
	    fprintf(datafp, "%s.\n", "get total double bit ecc error failed");
	}



//For getMemorySingleBitErrorCounterL1Cache()
    if(getMemorySingleBitErrorCounterL1Cache(device, &singleBitErrorL1CacheCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of single bit ecc error in L1 Cache is", singleBitErrorL1CacheCount);
		
	} else {
	    fprintf(datafp, "%s.\n", "get single bit ecc error in L1 Cache failed");
	}


//For getMemoryDoubleBitErrorCounterL1Cache()
    if(getMemoryDoubleBitErrorCounterL1Cache(device, &doubleBitErrorL1CacheCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of double bit ecc error in L1 Cache is", eccCountsTotalDouble);
	} else {
	    fprintf(datafp, "%s.\n", "get double bit ecc error in L1 Cache failed");
	}

//For getMemorySingleBitErrorCounterL2Cache()
    if(getMemorySingleBitErrorCounterL2Cache(device, &singleBitErrorL2CacheCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of single bit ecc error in L2 Cache is", singleBitErrorL2CacheCount);
	} else {
	    fprintf(datafp, "%s.\n", "get single bit ecc error in L2 Cache failed");
	}

//For getMemoryDoubleBitErrorCounterL2Cache()
    if(getMemoryDoubleBitErrorCounterL2Cache(device, &doubleBitErrorL2CacheCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of double bit ecc error in L2 Cache is", doubleBitErrorL2CacheCount);
	} else {
	    fprintf(datafp, "%s.\n", "get double bit ecc error in L2 Cache failed");
	}

//For getMemorySingleBitErrorCounterDeviceMemory()
    if(getMemorySingleBitErrorCounterDeviceMemory(device, &singleBitErrorDeviceMemoryCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of single bit ecc error in Device Memory is", singleBitErrorDeviceMemoryCount);
	} else {
	    fprintf(datafp, "%s.\n", "get single bit ecc error in Device Memory failed");
	}

//For getMemoryDoubleBitErrorCounterDeviceMemory()
    if(getMemoryDoubleBitErrorCounterDeviceMemory(device, &doubleBitErrorDeviceMemoryCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of double bit ecc error in Device Memory is", doubleBitErrorDeviceMemoryCount);
	} else {
	    fprintf(datafp, "%s.\n", "get double bit ecc error in Device Memory failed");
	}

//For getMemorySingleBitErrorCounterRegisterFile()
    if(getMemorySingleBitErrorCounterRegisterFile(device, &singleBitErrorRegisterFileCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of single bit ecc error in Register File is", singleBitErrorRegisterFileCount);
	} else {
	    fprintf(datafp, "%s.\n", "get single bit ecc error in Register File failed");
	}

//For getMemoryDoubleBitErrorCounterRegisterFile()
    if(getMemoryDoubleBitErrorCounterRegisterFile(device, &doubleBitErrorRegisterFileCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of double bit ecc error in Register File is", doubleBitErrorRegisterFileCount);
	} else {
	    fprintf(datafp, "%s.\n", "get double bit ecc error in Register File failed");
	}

//For getMemorySingleBitErrorCounterTextureMemory()
    if(getMemorySingleBitErrorCounterTextureMemory(device, &singleBitErrorTextureMemoryCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of single bit ecc error in Texture Memory is", singleBitErrorTextureMemoryCount);
	} else {
	    fprintf(datafp, "%s.\n", "get single bit ecc error in Texture Memory failed");
	}

//For getMemoryDoubleBitErrorCounterTextureMemory()
    if(getMemoryDoubleBitErrorCounterTextureMemory(device, &doubleBitErrorTextureMemoryCount) == 0){
	    fprintf(datafp, "%s %lld.\n", "the number of double bit ecc error in Texture Memory is", doubleBitErrorTextureMemoryCount);
	} else {
	    fprintf(datafp, "%s.\n", "get double bit ecc error in Texture Memory failed");
	}

//For getMemorySingleBitErrorCounterTextureShm()
// not support
/*
    if(getMemorySingleBitErrorCounterTextureShm(device, &singleBitErrorTextureShmCount) == 0){
	    fprintf("the number of single bit ecc error in Shared memory is %lld.\n", singleBitErrorTextureShmCount);
	} else {
	    fprintf("get single bit ecc error in Shared memory failed.\n");
	}

//For getMemoryDoubleBitErrorCounterTextureShm()
    if(getMemoryDoubleBitErrorCounterTextureShm(device, &doubleBitErrorTextureShmCount) == 0){
	    fprintf("the number of double bit ecc error in Shared memory is %lld.\n", doubleBitErrorTextureShmCount);
	} else {
	    fprintf("get double bit ecc error in Shared memory failed.\n");
	}

//For getMemorySingleBitErrorCounterCBU()
    if(getMemorySingleBitErrorCounterCBU(device, &singleBitErrorCBUCount) == 0){
	    fprintf("the number of single bit ecc error in CBU is %lld.\n", singleBitErrorCBUCount);
	} else {
	    fprintf("get single bit ecc error in CBU failed.\n");
	}

//For getMemoryDoubleBitErrorCounterCBU()
    if(getMemoryDoubleBitErrorCounterCBU(device, &doubleBitErrorCBUCount) == 0){
	    fprintf("the number of double bit ecc error in CBU is %lld.\n", doubleBitErrorCBUCount);
	} else {
	    fprintf("get double bit ecc error in CBU failed.\n");
	}
*/


//int getUtilizationRates()
    if(getUtilizationRates(device, deviceUtilization) == 0){
	    fprintf(datafp, "%s %u.\n", "the Utilization of GPU is", deviceUtilization->gpu);
	    fprintf(datafp, "%s %u.\n", "the Utilization of Memory is", deviceUtilization->memory);
	} else {
	    fprintf(datafp, "%s.\n", "get device's UtilizationRate failed");
	}


//int getEncoderUtilization()




//int getDecoderUtilization()


//int getComputeRunningProcesses()
    if(getComputeRunningProcesses(device, infos) == 0){
	    fprintf(datafp, "%s %u.\n", "Process ID is", infos->pid);
		fprintf(datafp, "%s %lld.\n", "used Gpu Memory is",infos->usedGpuMemory);
	} else {
	    fprintf(datafp, "%s.\n", "get Compute Running Processes failed");
	}



//int getBAR1MemoryInfo()
    if(getBAR1MemoryInfo(device, bar1Memory) == 0){
	    fprintf(datafp, "%s %lld.\n", "bar1 total memory is", bar1Memory->bar1Total);
		fprintf(datafp, "%s %lld.\n", "bar1 free memory is", bar1Memory->bar1Free);
		fprintf(datafp, "%s %lld.\n", "bar1 used memory is", bar1Memory->bar1Used);
	} else {
	    fprintf(datafp, "%s.\n", "get bar1 memory infos failed");
	}


    fprintf(datafp, "%s.\n", "####################");
    fprintf(datafp, "%s.\n", "####################");
	
//int getViolationStatus()

//shutdown
/*
    if(shutdown() == 0){
		printf("nvml shutdown succ.\n");
	} else {
		printf("nvml shutdown err.\n");
		return 1;
	}
*/	
// free

   free(devicename);
   free(memory);
   free(deviceUtilization);
   free(infos);
   free(bar1Memory);
//
    //fclose(datafp);
}

