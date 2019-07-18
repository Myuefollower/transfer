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

/*
int main(){
	if(init() == 0){
		printf("nvml init succ.\n");
	} else {
		printf("nvml init err.\n");
		return 1;
	}

	unsigned int length = 100;
	char *version =(char*)malloc(length*sizeof(char));
	char *versionnvml = (char*)malloc(length*sizeof(char));
	nvmlSystemGetDriverVersion(version,length);
	printf("the version is %s.\n",version);
	nvmlSystemGetNVMLVersion(versionnvml,length);
	printf("the version of nvml is $s.\n",versionnvml);


	//unsigned int index = 0;
	nvmlDevice_t device;
	char *name = (char*)malloc(sizeof(char)*length);
	unsigned int linkwid;
	if(getDevicehandle(&device) == 0){
		nvmlDeviceGetName(device,name,length);
		printf("the name of device 0 is %s.\n",name);

	}else {
		printf("error.\n");
	}

	if(getCurrPcieLinkWidth(device, &linkwid) == 0){
		printf("current pcie link width is %u.\n",linkwid);
	} else {
		printf("get current pcie link width err.\n");

	}

	unsigned int checksum;
	if(nvmlDeviceGetInforomConfigurationChecksum(device,&checksum)== NVML_SUCCESS){
		printf("checksum is %u.\n",checksum);
	} else {
		printf("get checksum error.\n");
	}

	unsigned int throughput;
	if(getPcieThroughput(device, &throughput) == 0){
		printf("the pcie throughput is %u.\n",throughput);
	} else {
		printf("get pcie throughput error.\n");

	}

	unsigned int pcierepcou;

	if(getPcieReplayCounter(device, &pcierepcou) == 0){
		printf("the pcie replay counter is %u.\n",pcierepcou);
	} else {
		printf("get pcie replay counter error.\n");

	}

	unsigned int speed;
	if(getFanSpeed(device, &speed) == 0){
		printf("the fan speed is %u.\n", speed);
	} else {
		printf("get fan speed error.\n");
	}



	if(shutdown() == 0){
		printf("nvml shutdown succ.\n");
	} else {
		printf("nvml shutdown err.\n");
		return 1;
	}
	

	free(version);
	free(versionnvml);
	free(name);
	return 0;

}
*/
