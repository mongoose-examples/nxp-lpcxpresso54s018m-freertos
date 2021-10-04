PROG = firmware

PROJECT_ROOT_PATH = $(realpath $(CURDIR)/../..)
DOCKER ?= docker run --rm -v $(PROJECT_ROOT_PATH):$(PROJECT_ROOT_PATH) -w $(CURDIR) mdashnet/armgcc

MONGOOSE_FLAGS = -DMG_ARCH=MG_ARCH_FREERTOS_LWIP
MCU_DEFINES = -DCPU_LPC54S018J4MET180=1 -DCPU_LPC54S018J4MET180_cm4 -DXIP_IMAGE -DCPU_LPC54S018J4M -D__USE_CMSIS -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 -DSERIAL_PORT_TYPE_UART=1 -DSDK_OS_FREE_RTOS -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -DDEBUG -D__NEWLIB__ -DNO_NXP_HEADERS
MCU_FLAGS =   -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -fstack-usage -specs=nano.specs
CFLAGS = -std=gnu99 -Os -g3 $(MONGOOSE_FLAGS) $(MCU_DEFINES) $(MCU_FLAGS)

SOURCES = $(shell find $(CURDIR) -type f -name '*.c')
OBJECTS = $(SOURCES:%.c=build/%.o)

INCLUDES = $(addprefix -I, $(shell find $(CURDIR) -type d -not -name 'build'))

LINKFLAGS = -nostdlib -Xlinker --gc-sections -Xlinker -print-memory-usage -Xlinker --sort-section=alignment -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -u _printf_float -u _scanf_float

all:
	$(info $(INCLUDES))

build: $(PROG).bin

$(PROG).bin: $(PROG).axf
	$(DOCKER) arm-none-eabi-size $<
	$(DOCKER) arm-none-eabi-objcopy -v -O binary $< $@

$(PROG).axf: $(OBJECTS)
	$(info LD $@)
	$(DOCKER) arm-none-eabi-gcc $(LINKFLAGS) -T"lpcxpresso54s018m-freertos.ld" -L"./ld" -L"./LPC54S018M/mcuxpresso/" $(OBJECTS) -lpower_hardabi -o $@

build/%.o: %.c
	@mkdir -p $(dir $@)
	$(info CC $<)
	@$(DOCKER) arm-none-eabi-gcc $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -rf build/ firmware.axf firmware.bin
