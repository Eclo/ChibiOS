# Required platform files.
PLATFORMSRC := $(CHIBIOS)/os/hal/ports/common/ARMCMx/nvic.c \
               $(CHIBIOS)/os/hal/ports/STM32/STM32F7xx/hal_lld.c

# Required include directories.
PLATFORMINC := $(CHIBIOS)/os/hal/ports/common/ARMCMx \
               $(CHIBIOS)/os/hal/ports/STM32/STM32F7xx

# Optional platform files.
ifeq ($(USE_SMART_BUILD),yes)
HALCONF := $(strip $(shell cat halconf.h | egrep -e "\#define"))

ifneq ($(findstring HAL_USE_EXT TRUE,$(HALCONF)),)
PLATFORMSRC += $(CHIBIOS)/os/hal/ports/STM32/STM32F7xx/hal_ext_lld_isr.c
endif
else
PLATFORMSRC += $(CHIBIOS)/os/hal/ports/STM32/STM32F7xx/hal_ext_lld_isr.c
endif

# Drivers compatible with the platform.
include $(CHIBIOS)/os/hal/ports/STM32/LLD/ADCv2/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/CANv1/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/DMAv2/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/EXTIv1/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/GPIOv2/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/I2Cv2/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/MACv1/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/OTGv1/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/QUADSPIv1/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/RTCv2/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/SPIv2/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/SDMMCv1/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/TIMv1/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/USARTv2/driver.mk
include $(CHIBIOS)/os/hal/ports/STM32/LLD/xWDGv1/driver.mk
