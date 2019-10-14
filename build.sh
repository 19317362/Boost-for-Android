


BOOST_DIR="boost_1_70_0"

BUILD_DIR="./build/"
PREFIX_DIR=$BUILD_DIR/install

export NDK_DIR=/home/declan/zone/low/Boost-for-Android/down/ndk/20

#ARCHLIST="arm64-v8a" 
ARCHLIST="arm64-v8a armeabi-v7a x86 x86_64"


LINKAGE_LIST="shared static" # can be "shared" or "static" or "shared static" (both)

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

#-----------------------------------------
USER_CONFIG_FILE=$(pwd)/user-config.jam
echo "USER_CONFIG_FILE = " $USER_CONFIG_FILE

cd $BOOST_DIR

#-------------------------------------------
# Bootstrap
# ---------
if [ ! -f ./$BOOST_DIR/b2 ]
then
  # Make the initial bootstrap
  echo "Performing boost bootstrap"


  ./bootstrap.sh 2>&1 | tee -a bootstrap.log
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
        {
            ./b2 -q                         \
                --ignore-site-config         \
                -j$num_cores                      \
                target-os=android           \
                toolset=clang-$toolset_name     \
                --user-config=$USER_CONFIG_FILE \
                link=$LINKAGE                  \
                threading=multi              \
                --layout=system           \
                $WITHOUT_LIBRARIES           \
                --build-dir="./../$BUILD_DIR/tmp/$ARCH" \
                --prefix=${PREFIX_DIR}/$ARCH \
                install 2>&1                 \
                || { echo "Error: Failed to build boost for $ARCH!" ; rm -rf ./../$BUILD_DIR/out/$ARCH ; exit 1 ; }
        } | tee -a build.log
        
    done # for ARCH in $ARCHLIST

done # for LINKAGE in $LINKAGE_LIST


echo "built boost to " ${PREFIX_DIR}


