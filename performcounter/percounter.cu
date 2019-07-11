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
		//printf("success.\n");
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
	} else if(returnValue == NVML_ERROR_NOT_FOUND){
	    printf("error, the sample entries are not found.\n");
		return 1;
	} else {
		printf("error unknown.\n");
		return 1;

	}

}


int handlePState(nvmlPstates_t *pState){
    int perforState;
    switch(*pState){
		    case NVML_PSTATE_0:
			    perforState = 0;
				break;
			case NVML_PSTATE_1:
			    perforState = 1;
				break;
		    case NVML_PSTATE_2:
			    perforState = 2;
				break;
			case NVML_PSTATE_3:
			    perforState = 3;
				break;
			case NVML_PSTATE_4:
			    perforState = 4;
				break;
            case NVML_PSTATE_5:
			    perforState = 5;
				break;
            case NVML_PSTATE_6:
			    perforState = 6;
				break;
            case NVML_PSTATE_7:
			    perforState = 7;
				break;
            case NVML_PSTATE_8:
			    perforState = 8;
				break;
            case NVML_PSTATE_9:
			    perforState = 9;
				break;
            case NVML_PSTATE_10:
			    perforState = 10;
				break;
            case NVML_PSTATE_11:
			    perforState = 11;
				break;
            case NVML_PSTATE_12:
			    perforState = 12;
				break;
            case NVML_PSTATE_13:
			    perforState = 13;
				break;
            case NVML_PSTATE_14:
			    perforState = 14;
				break;
            case NVML_PSTATE_15:
			    perforState = 15;
				break;
            default:
			    // NVML_PSTATE_UNKNOWN
                perforState = 32;			
		}
    return perforState;	    

}

int getDevicehandle(nvmlDevice_t *device){
	unsigned int index = 0;
	if(nvmlDeviceGetHandleByIndex(index,device) == NVML_SUCCESS){
		return 0;
	} else {
		return 1;
	}

}


int getMaxPcieLinkGeneration(nvmlDevice_t device, unsigned int *maxLinkGen){
    if(nvmlDeviceGetMaxPcieLinkGeneration(device, maxLinkGen) == NVML_SUCCESS) {
		return 0;
	} else {
		return 1;
	}


}



int getMaxPcieLinkWidth(nvmlDevice_t device, unsigned int *maxLinkWidth){
    if(nvmlDeviceGetMaxPcieLinkWidth(device, maxLinkWidth) == NVML_SUCCESS) {
		return 0;
	} else {
		return 1;
	}



}

int getCurrPcieLinkGeneration(nvmlDevice_t device, unsigned int *currLinkGen){
    nvmlReturn_t returnValue = nvmlDeviceGetCurrPcieLinkGeneration(device, currLinkGen);
	return handleReturnValue(returnValue);
}




int getCurrPcieLinkWidth(nvmlDevice_t device, unsigned int *currLinkWidth){
	nvmlReturn_t returnValue = nvmlDeviceGetCurrPcieLinkWidth(device, currLinkWidth);
	return handleReturnValue(returnValue);
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
	nvmlReturn_t returnValue = nvmlDeviceGetPcieReplayCounter(device, value);
	return handleReturnValue(returnValue);
}



int getCurrSMClockInfo(nvmlDevice_t device, unsigned int *currSmClock){
    nvmlClockType_t type = NVML_CLOCK_SM;
	nvmlReturn_t returnValue = nvmlDeviceGetClockInfo(device, type, currSmClock);
    return handleReturnValue(returnValue);
}


int getCurrMEMClockInfo(nvmlDevice_t device, unsigned int *currMemClock){
    nvmlClockType_t type = NVML_CLOCK_MEM;
    nvmlReturn_t returnValue = nvmlDeviceGetClockInfo(device, type, currMemClock);
	return handleReturnValue(returnValue);
}


int getMaxSMClockInfo(nvmlDevice_t device, unsigned int *maxSmClock){
    nvmlClockType_t type = NVML_CLOCK_SM;
    nvmlReturn_t returnValue = nvmlDeviceGetMaxClockInfo(device, type, maxSmClock);
	return handleReturnValue(returnValue);
}



int getMaxMEMClockInfo(nvmlDevice_t device, unsigned int *maxMemClock){
    nvmlClockType_t type = NVML_CLOCK_MEM;
    nvmlReturn_t returnValue = nvmlDeviceGetMaxClockInfo(device, type, maxMemClock);
	return handleReturnValue(returnValue);
}


int getSMApplicationsClock(nvmlDevice_t device, unsigned int *smclockMHz){
    nvmlClockType_t type = NVML_CLOCK_SM;
    nvmlReturn_t returnValue = nvmlDeviceGetApplicationsClock(device, type, smclockMHz);
	return handleReturnValue(returnValue);
}


int GetMEMApplicationsClock(nvmlDevice_t device, unsigned int *memclockMHz){
    nvmlClockType_t type = NVML_CLOCK_MEM;
    nvmlReturn_t returnValue = nvmlDeviceGetApplicationsClock(device, type, memclockMHz);
	return handleReturnValue(returnValue);
}




int getCurrSMClock(nvmlDevice_t device, unsigned int *currsmclo){
    nvmlClockType_t type = NVML_CLOCK_SM;
    nvmlClockId_t clockId = NVML_CLOCK_ID_CURRENT;
	nvmlReturn_t returnValue = nvmlDeviceGetClock(device, type, clockId, currsmclo) == NVML_SUCCESS);
	return handleReturnValue(returnValue);
}


int getCurrMEMClock(nvmlDevice_t device, unsigned int *currmemclo){
    nvmlClockType_t type = NVML_CLOCK_MEM;
    nvmlClockId_t clockId = NVML_CLOCK_ID_CURRENT;
	nvmlReturn_t returnValue = nvmlDeviceGetClock(device, type, clockId, currmemclo);
	return handleReturnValue(returnValue);
}


int getAppSMClock(nvmlDevice_t device, unsigned int *appsmclo){
    nvmlClockType_t type = NVML_CLOCK_SM;
    nvmlClockId_t clockId = NVML_CLOCK_ID_APP_CLOCK_TARGET;
	nvmlReturn_t returnValue = nvmlDeviceGetClock(device, type, clockId, appsmclo);
}


int getAppMEMClock(nvmlDevice_t device, unsigned int *appmemclo){
    nvmlClockType_t type = NVML_CLOCK_MEM;
    nvmlClockId_t clockId = NVML_CLOCK_ID_APP_CLOCK_TARGET;
	nvmlReturn_t returnValue = nvmlDeviceGetClock(device, type, clockId, appmemclo};
	return handleReturnValue(returnValue);
}


int getDefSMClock(nvmlDevice_t device, unsigned int *defsmclo){
    nvmlClockType_t type = NVML_CLOCK_SM;
    nvmlClockId_t clockId = NVML_CLOCK_ID_APP_CLOCK_DEFAULT;
	nvmlReturn_t returnValue = nvmlDeviceGetClock(device, type, clockId, defsmclo);
	return handleReturnValue(returnValue);
}


int getDefMEMClock(nvmlDevice_t device, unsigned int *defmemclo){
    nvmlClockType_t type = NVML_CLOCK_MEM;
    vmlClockId_t clockId = NVML_CLOCK_ID_APP_CLOCK_DEFAULT;
	nvmlReturn_t returnValue = nvmlDeviceGetClock(device, type, clockId, defmemclo);
	return handleReturnValue(returnValue);
}


int getTemperature(nvmlDevice_t device, unsigned int *temp){
    nvmlTemperatureSensors_t sensorType = NVML_TEMPERATURE_GPU;
    nvmlReturn_t returnValue = nvmlDeviceGetTemperature(device, type, temp);
	return handleReturnValue(returnValue);
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


int getPerformanceState(nvmlDevice_t device, nvmlPstates_t *perState, int perforState){
    nvmlReturn_t returnValue = nvmlDeviceGetPerformanceState(device, perState);
	if(returnValue == NVML_SUCCESS){
	    perforState = handlePState(perState);
	    return 0;
	} else {
	    return handleReturnValue(returnValue);
	}
}


int getPowerState(nvmlDevice_t device, nvmlPstates_t *powState, int powerState){
    nvmlReturn_t returnValue = nvmlDeviceGetPowerState(device, powState);
	if(returnValue == NVML_SUCCESS){
	    powerState = handlePState(powState);
	    return 0;
	} else {
	    return handleReturnValue(returnValue);
	}
}


int getMemoryInfo(nvmlDevice_t device, nvmlMemory_t *memory){
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryInfo(device, memory);
	return handleReturnValue(returnValue);

}



int getTotalVolatileSingleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts){
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
    nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
    nvmlReturn_t returnValue = nvmlDeviceGetTotalEccErrors(device, errorType, counterType, eccCounts);
    return handleReturnValue(returnValue);
	
}


int getTotalAggregateSingleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts){
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
    nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
    nvmlReturn_t returnValue = nvmlDeviceGetTotalEccErrors(device, errorType, counterType, eccCounts);
    return handleReturnValue(returnValue);
	
}




int getTotalVolatileDoubleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts){
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_VOLATILE_ECC;
    nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
    nvmlReturn_t returnValue = nvmlDeviceGetTotalEccErrors(device, errorType, counterType, eccCounts);
	return handleReturnValue(returnValue);
}

int getTotalAggregateDoubleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts){
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
    nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
    nvmlReturn_t returnValue = nvmlDeviceGetTotalEccErrors(device, errorType, counterType, eccCounts);
	return handleReturnValue(returnValue);
}


int getMemoryVolatileSingleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count){

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


int getMemoryAggregateSingleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_L1_CACHE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
	return handleReturnValue(returnValue);

}



int getMemoryVolatileDoubleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateDoubleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_L1_CACHE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}




int getMemoryVolatileSingleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateSingleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_L2_CACHE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryVolatileDoubleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateDoubleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_L2_CACHE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryVolatileSingleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateSingleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_DEVICE_MEMORY;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryVolatileDoubleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateDoubleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_DEVICE_MEMORY;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}



int getMemoryVolatileSingleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count){

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


int getMemoryAggregateSingleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_REGISTER_FILE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}



int getMemoryVolatileDoubleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateSDoubleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_REGISTER_FILE;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}




int getMemoryVolatileSingleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateSingleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_TEXTURE_MEMORY;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryVolatileDoubleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateDoubleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_TEXTURE_MEMORY;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryVolatileSingleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateSingleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_TEXTURE_SHM;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryVolatileDoubleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateDoubleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_TEXTURE_SHM;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}



int getMemoryVolatileSingleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateSingleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_CORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
	nvmlMemoryLocation_t locationType = NVML_MEMORY_LOCATION_CBU;
    nvmlReturn_t returnValue = nvmlDeviceGetMemoryErrorCounter(device, errorType, counterType, locationType, count);
    return handleReturnValue(returnValue);

}


int getMemoryVolatileDoubleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count){

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

int getMemoryAggregateDoubleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count){

	//NVML_MEMORY_ERROR_TYPE_CORRECTED = 0
	//NVML_MEMORY_ERROR_TYPE_UNCORRECTED = 1
	nvmlMemoryErrorType_t errorType = NVML_MEMORY_ERROR_TYPE_UNCORRECTED;
	
    //NVML_VOLATILE_ECC = 0
	//NVML_AGGREGATE_ECC = 1
    nvmlEccCounterType_t counterType = NVML_AGGREGATE_ECC;
	
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


int getTotalPowerSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples){
    nvmlSamplingType_t type = NVML_TOTAL_POWER_SAMPLES;
	nvmlValueType_t sampleValType;
	unsigned int sampleCount = 1;
	nvmlReturn_t returnValue = nvmlDeviceGetSamples(device, type, lastSeenTimeStamp, &sampleValType, &sampleCount, samples);
	return handleReturnValue(returnValue);
}


int getGpuUtilizationSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples){
    nvmlSamplingType_t type = NVML_GPU_UTILIZATION_SAMPLES;
	nvmlValueType_t sampleValType;
	unsigned int sampleCount = 1;
    nvmlReturn_t returnValue = nvmlDeviceGetSamples(device, type, lastSeenTimeStamp, &sampleValType, &sampleCount, samples);
	return handleReturnValue(returnValue);
}


int getMemoryUtilizationSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples){
    nvmlSamplingType_t type = NVML_MEMORY_UTILIZATION_SAMPLES;
	nvmlValueType_t sampleValType;
	unsigned int sampleCount = 1;
	nvmlReturn_t returnValue = nvmlDeviceGetSamples(device, type, lastSeenTimeStamp, &sampleValType, &sampleCount, samples);
	return handleReturnValue(returnValue);
}


int getENCUtilizationSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples){
    nvmlSamplingType_t type = NVML_ENC_UTILIZATION_SAMPLES;
	nvmlValueType_t sampleValType;
	unsigned int sampleCount = 1;
	nvmlReturn_t returnValue = nvmlDeviceGetSamples(device, type, lastSeenTimeStamp, &sampleValType, &sampleCount, samples);
	return handleReturnValue(returnValue);
}


int getDECUtilizationSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples){
    nvmlSamplingType_t type = NVML_DEC_UTILIZATION_SAMPLES;
	nvmlValueType_t sampleValType;
	unsigned int sampleCount = 1;
    nvmlReturn_t returnValue = nvmlDeviceGetSamples(device, type, lastSeenTimeStamp, &sampleValType, &sampleCount, samples);
	return handleReturnValue(returnValue);
}


int getProcessorCLKSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples){
    nvmlSamplingType_t type = NVML_PROCESSOR_CLK_SAMPLES;
	nvmlValueType_t sampleValType;
	unsigned int sampleCount = 1;
	nvmlReturn_t returnValue = nvmlDeviceGetSamples(device, type, lastSeenTimeStamp, &sampleValType, &sampleCount, samples);
	return handleReturnValue(returnValue);
}


int getMemoryCLKSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples){
    nvmlSamplingType_t type = NVML_MEMORY_CLK_SAMPLES;
	nvmlValueType_t sampleValType;
	unsigned int sampleCount = 1;
	nvmlReturn_t returnValue = nvmlDeviceGetSamples(device, type, lastSeenTimeStamp, &sampleValType, &sampleCount, samples);
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





int getRetiredPagesSingleBitError(nvmlDevice_t device, unsigned int *pageCount){
    nvmlPageRetirementCause_t cause = NVML_PAGE_RETIREMENT_CAUSE_MULTIPLE_SINGLE_BIT_ECC_ERRORS;
    unsigned long long address;
	nvmlReturn_t returnValue = nvmlDeviceGetRetiredPages(device, cause, pageCount, &address);
	return handleReturnValue(returnValue);
}


int getRetiredPagesDoubleBitError(nvmlDevice_t device, unsigned int *pageCount){
    nvmlPageRetirementCause_t cause = NVML_PAGE_RETIREMENT_CAUSE_DOUBLE_BIT_ECC_ERROR;
	unsigned long long address;
	nvmlReturn_t returnValue = nvmlDeviceGetRetiredPages(device, cause, pageCount, &address);
	return handleReturnValue(returnValue);
}



int getFieldValues(nvmlDevice_t device, int valuesCount, nvmlFieldValue_t *values){



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
