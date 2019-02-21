LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

MY_CPP_LIST := 
MY_CPP_LIST += $(wildcard $(LOCAL_PATH)/libleaktracer/src/*.cpp)
#MY_CPP_LIST += $(wildcard $(LOCAL_PATH)/libleaktracer/src/*.c)

MY_CPP_INCLUDES := $(LOCAL_PATH)
MY_CPP_INCLUDES += $(LOCAL_PATH)/libleaktracer/include

common_shared_libraries := 

common_static_libraries := 

LOCAL_MODULE := leaktracer
LOCAL_SRC_FILES:= $(MY_CPP_LIST:$(LOCAL_PATH)/%=%)
LOCAL_C_INCLUDES := $(MY_CPP_INCLUDES)
LOCAL_SHARED_LIBRARIES := $(common_shared_libraries)
LOCAL_STATIC_LIBRARIES := $(common_static_libraries)

LOCAL_CPPFLAGS := -std=c++11 -pthread
LOCAL_CPPFLAGS += -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D_GLIBCXX_USE_SCHED_YIELD -D_GLIBCXX_USE_NANOSLEEP -DPOSIX
LOCAL_CPPFLAGS += -Wall -Werror 
LOCAL_CPPFLAGS += -Wno-literal-suffix -Wno-unused-variable
#LOCAL_CPPFLAGS += -DUSE_BACKTRACE
LOCAL_CPPFLAGS += -DLOGGER -fvisibility=hidden

LOCAL_LDLIBS += -llog -lz
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true

#include $(BUILD_EXECUTABLE)
include $(BUILD_SHARED_LIBRARY)
