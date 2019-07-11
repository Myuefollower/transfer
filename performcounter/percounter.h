#ifndef PERCOUNTER_H
#define FERCOUNTER_H

int init();
int shutdown();
void print(char *content);
int getDevicehandle(nvmlDevice_t *device);
int getMaxPcieLinkGeneration(nvmlDevice_t device, unsigned int *maxLinkGen);
int getMaxPcieLinkWidth(nvmlDevice_t device, unsigned int *maxLinkWidth);
int getCurrPcieLinkGeneration(nvmlDevice_t device, unsigned int *currLinkGen);
int getCurrPcieLinkWidth(nvmlDevice_t device, unsigned int *currLinkWidth);
int getPcieThroughput(nvmlDevice_t device, unsigned int *value);
int getPcieReplayCounter(nvmlDevice_t device, unsigned int *value);

int handleRenturnValue(nvmlReturn_t returnV);
int handlePState(nvmlPstates_t *pState);

int getCurrSMClockInfo(nvmlDevice_t device, unsigned int *currSmClock);
int getCurrMEMClockInfo(nvmlDevice_t device, unsigned int *currMemClock);
int getSMApplicationsClock(nvmlDevice_t device, unsigned int *smclockMHz);
int GetMEMApplicationsClock(nvmlDevice_t device, unsigned int *memclockMHz);
int getMaxSMClockInfo(nvmlDevice_t device, unsigned int *maxSmClock);
int getMaxMEMClockInfo(nvmlDevice_t device, unsigned int *maxMemClock);

int getCurrSMClock(nvmlDevice_t device, unsigned int *currsmclo);
int getCurrMEMClock(nvmlDevice_t device, unsigned int *currmemclo);
int getAppSMClock(nvmlDevice_t device, unsigned int *appsmclo);
int getAppMEMClock(nvmlDevice_t device, unsigned int *appmemclo);
int getDefSMClock(nvmlDevice_t device, unsigned int *defsmclo);
int getDefMEMClock(nvmlDevice_t device, unsigned int *defmemclo);

int getTemperature(nvmlDevice_t device, unsigned int *temp);
int getFanSpeed(nvmlDevice_t device, unsigned int *speed);
int getPowerUsage(nvmlDevice_t device, unsigned int *power);
int getTotalEnergyConsumption(nvmlDevice_t device, unsigned long long *energy);
int getMemoryInfo(nvmlDevice_t device, nvmlMemory_t *memory);
int getPerformanceState(nvmlDevice_t device, nvmlPstates_t *perState, int perforState);
int getPowerState(nvmlDevice_t device, nvmlPstates_t *powState, int powerState);

int getTotalVolatileSingleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts);
int getTotalAggregateSingleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts);

int getTotalVolatileDoubleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts);
int getTotalAggregateDoubleBitEccErrors(nvmlDevice_t device, unsigned long long *eccCounts);

int getMemoryVolatileSingleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateSingleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileDoubleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateDoubleBitErrorCounterL1Cache(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileSingleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateSingleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileDoubleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateDoubleBitErrorCounterL2Cache(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileSingleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateSingleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileDoubleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateDoubleBitErrorCounterDeviceMemory(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileSingleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateSingleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileDoubleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateDoubleBitErrorCounterRegisterFile(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileSingleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateSingleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileDoubleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateDoubleBitErrorCounterTextureMemory(nvmlDevice_t device, unsigned long long *count);




int getMemoryVolatileSingleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateSingleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileDoubleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateDoubleBitErrorCounterTextureShm(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileSingleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateSingleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count);

int getMemoryVolatileDoubleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count);
int getMemoryAggregateDoubleBitErrorCounterCBU(nvmlDevice_t device, unsigned long long *count);



int getUtilizationRates(nvmlDevice_t device, nvmlUtilization_t *utilization);
int getEncoderUtilization(nvmlDevice_t device, unsigned int *utilization, unsigned int *samplingPeriodUs);
//int GetEncoderCapacity(nvmlDevice_t device, unsigned int *encoderCapacity);
//int getEncoderStats(nvmlDevice_t device, unsigned int *sessionCount, unsigned int *averageFps, unsigned int *averageLatency);
int getDecoderUtilization(nvmlDevice_t device, unsigned int *utilization, unsigned int *samplingPeriodUs);
//int getFBCStats(nvmlDevice_t device, nvmlFBCStats_t *fbcStats);
int getComputeRunningProcesses(nvmlDevice_t device, nvmlProcessInfo_t *infos);

//
//int getSamples(nvmlDevice_t device, nvmlSamplingType_t type, unsigned long long lastSeenTimeStamp, nvmlValueType_t *sampleValType, unsigned int *sampleCount, nvmlSample_t *samples);
int getTotalPowerSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples);
int getGpuUtilizationSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples);
int getMemoryUtilizationSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples);
int getENCUtilizationSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples);
int getDECUtilizationSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples);
int getProcessorCLKSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples);
int getMemoryCLKSamples(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlSample_t *samples);
//
int getBAR1MemoryInfo(nvmlDevice_t device, nvmlBAR1Memory_t *bar1Memory);
int getViolationStatus(nvmlDevice_t device, nvmlPerfPolicyType_t perfPolicyType, nvmlViolationTime_t *violTime);

int getRetiredPagesSingleBitError(nvmlDevice_t device, unsigned int *pageCount);
int getRetiredPagesDoubleBitError(nvmlDevice_t device, unsigned int *pageCount);
//int getNvLinkState();
//int getNvLinkErrorCounterReplay(nvmlDevice_t device, unsigned int link, unsigned long long *counterValue);
//int getNvLinkErrorCounterRecovery(nvmlDevice_t device, unsigned int link, unsigned long long *counterValue);
//int getNvLinkErrorCounterCRCFlit(nvmlDevice_t device, unsigned int link, unsigned long long *counterValue);
//int getNvLinkErrorCounterCRCData(nvmlDevice_t device, unsigned int link, unsigned long long *counterValue);
//int getNvLinkUtilizationCounter(nvmlDevice_t device, unsigned int link, unsigned int counter, unsigned long long *rxcounter, unsigned long long *txcounter);



//DeviceRegisterEvents
//mingtian
int getFieldValues(nvmlDevice_t device, int valuesCount, nvmlFieldValue_t *values);


//undefined

//int getSupportedVgpus(nvmlDevice_t device, unsigned int *vgpuCount, nvmlVgpuTypeId_t *vgpuTypeIds);
//int getActiveVgpus(nvmlDevice_t device, unsigned int *vgpuCount, nvmlVgpuInstance_t *vgpuInstances);
//nvmlReturn_t nvmlVgpuInstanceGetFbUsage?
//int vgpuInstanceGetEncoderCapacity(nvmlVgpuInstance_t vgpuInstance, unsigned int *encoderCapacity);
//int getVgpuUtilization(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, nvmlValueType_t *sampleValType, unsigned int *vgpuInstanceSamplesCount, nvmlVgpuInstanceUtilizationSample_t *utilizationSamples);
//int getVgpuProcessUtilization(nvmlDevice_t device, unsigned long long lastSeenTimeStamp, unsigned int *vgpuProcessSamplesCount, nvmlVgpuProcessUtilizationSample_t *utilizationSamples);
//int vgpuInstanceGetEncoderStats(nvmlVgpuInstance_t vgpuInstance, unsigned int *sessionCount, unsigned int *averageFps, unsigned int *averageLatency);
//int vgpuInstanceGetFBCStats(nvmlVgpuInstance_t vgpuInstance, nvmlFBCStats_t *fbcStats);
//int getProcessUtilization(nvmlDevice_t device, nvmlProcessUtilizationSample_t *utilization, unsigned int *processSamplesCount, unsigned long long lastSeenTimeStamp);

#endif
