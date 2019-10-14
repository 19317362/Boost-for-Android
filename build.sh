
# see here for info on "new paths for toolchains":
# https://developer.android.com/ndk/guides/other_build_systems

# also useful ndk details:
# https://android.googlesource.com/platform/ndk/+/master/docs/BuildSystemMaintainers.md




#----------------------------------------------------

BUILD_DIR=$(pwd)/build
mkdir --parents $BUILD_DIR

PREFIX_DIR=${BUILD_DIR}/install

WITHOUT_LIBRARIES=--without-python

#----------------------------------------------------------------------------------
# map ARCH to toolset name (following "using clang :") used in user-config.jam
toolset_for_arch() {


    local arch=$1
    
    case "$arch" in
        arm64-v8a)      echo "arm64v8a"
        ;;
        armeabi-v7a)    echo "armeabiv7a"
        ;;
        x86)            echo "x86"
        ;;
        x86_64)         echo "x8664"
        ;;
        
    esac
    
}

#----------------------------------------------------------------------------------
# map abi to pass to b2 .. omplains 
abi_for_arch() {


    local arch=$1
    
    case "$arch" in
        arm64-v8a)      echo "aapcs"
        ;;
        armeabi-v7a)    echo "aapcs"
        ;;
        x86)            echo "sysv"
        ;;
        x86_64)         echo "sysv"
        ;;
        
    esac
    
}

#-----------------------------------------
USER_CONFIG_FILE=$(pwd)/user-config.jam
echo "USER_CONFIG_FILE = " $USER_CONFIG_FILE




cd $BOOST_DIR

#-------------------------------------------
# Bootstrap
# ---------
if [ ! -f ${BOOST_DIR}/b2 ]
then
  # Make the initial bootstrap
  echo "Performing boost bootstrap"

  ./bootstrap.sh # 2>&1 | tee -a bootstrap.log
fi
  
#-------------------------------------------  

# use as many cores as available (for build)
num_cores=$(grep -c ^processor /proc/cpuinfo)
echo " cores available = " $num_cores 

 
#------------------------------------------- 
                
# layout=versioned | system     

 
         
for LINKAGE in $LINKAGE_LIST; do

    for ARCH in $ARCHLIST; do
    
        toolset_name="$(toolset_for_arch $ARCH)"
        abi_name="$(abi_for_arch $ARCH)"

        {
             #abi=aapcs address-model=32 architecture=arm binary-format=elf threading=multi toolset=clang \
            ./b2 -q                         \
                abi=$abi_name    \
                toolset=clang-$toolset_name     \
                --ignore-site-config         \
                -j$num_cores                      \
                target-os=android           \
                --user-config=$USER_CONFIG_FILE \
                link=$LINKAGE                  \
                threading=multi              \
                --layout=system           \
                $WITHOUT_LIBRARIES           \
                --build-dir=${BUILD_DIR}/tmp/$ARCH \
                --prefix=${PREFIX_DIR}/$ARCH \
                install 2>&1                 \
                || { echo "Error: Failed to build boost for $ARCH!";}
        } | tee -a ${BUILD_DIR}/build.log
        
    done # for ARCH in $ARCHLIST
    
done # for LINKAGE in $LINKAGE_LIST


echo "built boost to "  ${PREFIX_DIR}


