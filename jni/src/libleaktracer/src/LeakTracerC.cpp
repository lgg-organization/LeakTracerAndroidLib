#include "leaktracer.h"
#include "MemoryTrace.hpp"

#define EXPORT __attribute__ ((visibility ("default")))

/** starts monitoring memory allocations in all threads */
EXPORT void leaktracer_startMonitoringAllThreads()
{
	leaktracer::MemoryTrace::GetInstance().startMonitoringAllThreads();
}

/** starts monitoring memory allocations in current thread */
EXPORT void leaktracer_startMonitoringThisThread()
{
	leaktracer::MemoryTrace::GetInstance().startMonitoringThisThread();
}

/** stops monitoring memory allocations (in all threads or in
 *   this thread only, depends on the function used to start
 *   monitoring
 */
EXPORT void leaktracer_stopMonitoringAllocations()
{
	leaktracer::MemoryTrace::GetInstance().stopMonitoringAllocations();
}

/** stops all monitoring - both of allocations and releases */
EXPORT void leaktracer_stopAllMonitoring()
{
	leaktracer::MemoryTrace::GetInstance().stopAllMonitoring();
}

/** writes report with all memory leaks */
EXPORT void leaktracer_writeLeaksToFile(const char* reportFileName)
{
	leaktracer::MemoryTrace::GetInstance().writeLeaksToFile(reportFileName);
}
