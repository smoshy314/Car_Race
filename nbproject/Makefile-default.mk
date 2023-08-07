#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Project_1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Project_1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=lcd.c led.c utils.c ssd.c acl.c i2c.c mic.c adc.c srv.c pmods.c Proj4.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/lcd.o ${OBJECTDIR}/led.o ${OBJECTDIR}/utils.o ${OBJECTDIR}/ssd.o ${OBJECTDIR}/acl.o ${OBJECTDIR}/i2c.o ${OBJECTDIR}/mic.o ${OBJECTDIR}/adc.o ${OBJECTDIR}/srv.o ${OBJECTDIR}/pmods.o ${OBJECTDIR}/Proj4.o
POSSIBLE_DEPFILES=${OBJECTDIR}/lcd.o.d ${OBJECTDIR}/led.o.d ${OBJECTDIR}/utils.o.d ${OBJECTDIR}/ssd.o.d ${OBJECTDIR}/acl.o.d ${OBJECTDIR}/i2c.o.d ${OBJECTDIR}/mic.o.d ${OBJECTDIR}/adc.o.d ${OBJECTDIR}/srv.o.d ${OBJECTDIR}/pmods.o.d ${OBJECTDIR}/Proj4.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/lcd.o ${OBJECTDIR}/led.o ${OBJECTDIR}/utils.o ${OBJECTDIR}/ssd.o ${OBJECTDIR}/acl.o ${OBJECTDIR}/i2c.o ${OBJECTDIR}/mic.o ${OBJECTDIR}/adc.o ${OBJECTDIR}/srv.o ${OBJECTDIR}/pmods.o ${OBJECTDIR}/Proj4.o

# Source Files
SOURCEFILES=lcd.c led.c utils.c ssd.c acl.c i2c.c mic.c adc.c srv.c pmods.c Proj4.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Project_1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX370F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/lcd.o: lcd.c  .generated_files/flags/default/e7e2eab920a30acfa24a6de6b32a9c521c8c2ec2 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lcd.o.d 
	@${RM} ${OBJECTDIR}/lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/lcd.o.d" -o ${OBJECTDIR}/lcd.o lcd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/led.o: led.c  .generated_files/flags/default/46c432a08cb095c98230a37791ac56bc8742d94e .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/led.o.d 
	@${RM} ${OBJECTDIR}/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/led.o.d" -o ${OBJECTDIR}/led.o led.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/utils.o: utils.c  .generated_files/flags/default/d4372a7dd9299520366714f9e4fd31d80a517c49 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/utils.o.d 
	@${RM} ${OBJECTDIR}/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/utils.o.d" -o ${OBJECTDIR}/utils.o utils.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ssd.o: ssd.c  .generated_files/flags/default/ed60bb2e1f5ec11f5ef9a7971c1bc171d3f55c4b .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ssd.o.d 
	@${RM} ${OBJECTDIR}/ssd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/ssd.o.d" -o ${OBJECTDIR}/ssd.o ssd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/acl.o: acl.c  .generated_files/flags/default/f37ce2a5cfdafd7d6c4d731adaa9c8ef68ad5a5b .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/acl.o.d 
	@${RM} ${OBJECTDIR}/acl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/acl.o.d" -o ${OBJECTDIR}/acl.o acl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/flags/default/9eea24c2a2744bd32f8361e8df8dad4634e5ead4 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/i2c.o.d" -o ${OBJECTDIR}/i2c.o i2c.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mic.o: mic.c  .generated_files/flags/default/991256c2b8887a9c51b66b1400c94b3391e24566 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mic.o.d 
	@${RM} ${OBJECTDIR}/mic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mic.o.d" -o ${OBJECTDIR}/mic.o mic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/adc.o: adc.c  .generated_files/flags/default/df7935b0ff0574479d577841dd80ccf540418801 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc.o.d 
	@${RM} ${OBJECTDIR}/adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/adc.o.d" -o ${OBJECTDIR}/adc.o adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/srv.o: srv.c  .generated_files/flags/default/4bdd31b4fe7e912d644fb1b85019b485573662ba .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/srv.o.d 
	@${RM} ${OBJECTDIR}/srv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/srv.o.d" -o ${OBJECTDIR}/srv.o srv.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/pmods.o: pmods.c  .generated_files/flags/default/b3d4619b54d54049e0a79cf0fc97017a79ea8a7f .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmods.o.d 
	@${RM} ${OBJECTDIR}/pmods.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/pmods.o.d" -o ${OBJECTDIR}/pmods.o pmods.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Proj4.o: Proj4.c  .generated_files/flags/default/238226179a89bcb7e1882ab0ad8c47320381f32d .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Proj4.o.d 
	@${RM} ${OBJECTDIR}/Proj4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Proj4.o.d" -o ${OBJECTDIR}/Proj4.o Proj4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/lcd.o: lcd.c  .generated_files/flags/default/fa58e4ac92f602f7d37c6dd915511a1049c11a4 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lcd.o.d 
	@${RM} ${OBJECTDIR}/lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/lcd.o.d" -o ${OBJECTDIR}/lcd.o lcd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/led.o: led.c  .generated_files/flags/default/d64eb6e9089a368899b0c7494414893a09945a9d .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/led.o.d 
	@${RM} ${OBJECTDIR}/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/led.o.d" -o ${OBJECTDIR}/led.o led.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/utils.o: utils.c  .generated_files/flags/default/11a6d0100bee8bc866206a78b491b09a67340bfd .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/utils.o.d 
	@${RM} ${OBJECTDIR}/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/utils.o.d" -o ${OBJECTDIR}/utils.o utils.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ssd.o: ssd.c  .generated_files/flags/default/71053c007cdb5afb088bf736f3d101c6d2cb4ecd .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ssd.o.d 
	@${RM} ${OBJECTDIR}/ssd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/ssd.o.d" -o ${OBJECTDIR}/ssd.o ssd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/acl.o: acl.c  .generated_files/flags/default/41f665e7f39d41b0348cd6e6947b813fe840ef1 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/acl.o.d 
	@${RM} ${OBJECTDIR}/acl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/acl.o.d" -o ${OBJECTDIR}/acl.o acl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/flags/default/6c5b93b8a576ad2f8e7a8310c648b7aace37ceef .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/i2c.o.d" -o ${OBJECTDIR}/i2c.o i2c.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mic.o: mic.c  .generated_files/flags/default/f5f95c0f3aabbcdc9f82864bfe89434643ef0a27 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mic.o.d 
	@${RM} ${OBJECTDIR}/mic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/mic.o.d" -o ${OBJECTDIR}/mic.o mic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/adc.o: adc.c  .generated_files/flags/default/7aebe056cbf236f4dffec9474e187ed66aa1b099 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc.o.d 
	@${RM} ${OBJECTDIR}/adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/adc.o.d" -o ${OBJECTDIR}/adc.o adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/srv.o: srv.c  .generated_files/flags/default/ae71e86a7de5bda4ac4d349220b0dffb5c59f16 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/srv.o.d 
	@${RM} ${OBJECTDIR}/srv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/srv.o.d" -o ${OBJECTDIR}/srv.o srv.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/pmods.o: pmods.c  .generated_files/flags/default/c611fabd376a7993228b6c4683253f3a6ff9ee56 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmods.o.d 
	@${RM} ${OBJECTDIR}/pmods.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/pmods.o.d" -o ${OBJECTDIR}/pmods.o pmods.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Proj4.o: Proj4.c  .generated_files/flags/default/9d8503275e964836a0d0a4ab673ec0a87c61ce4 .generated_files/flags/default/b049a9946035c0d6f8c1361b9c30a33141c1b72d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Proj4.o.d 
	@${RM} ${OBJECTDIR}/Proj4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Proj4.o.d" -o ${OBJECTDIR}/Proj4.o Proj4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Project_1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Project_1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC0275F  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Project_1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Project_1.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/Project_1.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
