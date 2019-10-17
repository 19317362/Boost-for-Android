

NEEDED:
-------
 patchelf --remove-needed libboost_system.so.1.69.0 libboost_chrono.so 
 readelf -a libboost_chrono.so | grep NEEDED

 patchelf --add-needed libboost_system.so libboost_chrono.so 
 readelf -a libboost_chrono.so | grep NEEDED


SONAME:
-------
 readelf -a libboost_chrono.so | grep SONAME
 patchelf --set-soname libboost_system.so libboost_system.so
 patchelf --set-soname libboost_chrono.so libboost_chrono.so
 
 ----------------------------------------------------------
 orig:
 
   compile
  ---------
  "clang++" -c -x c++ -fvisibility-inlines-hidden -fPIC -O3 -Wall -fvisibility=hidden -Wno-inline  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DNDEBUG -I"." -o "/tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/error_code.o" "libs/system/src/error_code.cpp"

CXX PARAMS -in- = -c -x c++ -fvisibility-inlines-hidden -fPIC -O3 -Wall -fvisibility=hidden -Wno-inline -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DNDEBUG -I. -o 
/tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/error_code.o libs/system/src/error_code.cpp  
.......................................... INSTALL Jamroot LICENSE_1_0.txt README.md b2 boost boost-build.jam boost.css boost.png boostcpp.jam bootstrap.bat bootstrap.log bootstrap.sh doc index.htm index.html libs more project-config.jam rst.css run_log.txt status tools user-config.jam

CXX PARAMS --passed-- =  -fno-integrated-as -fPIC   -I/home/declan/zone/low/boost/Boost-for-Android/down/ndk/20/sysroot/usr/include 
-I/home/declan/zone/low/boost/Boost-for-Android/down/ndk/20/sysroot/usr/include/aarch64-linux-android 
-I/home/declan/zone/low/boost/Boost-for-Android/down/ndk/20/sources/crystax/include 
-Wno-long-long -c -x c++ -fvisibility-inlines-hidden -fPIC -O3 -Wall -fvisibility=hidden -Wno-inline -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DNDEBUG -I. -o 
/tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/error_code.o libs/system/src/error_code.cpp 
 .......................................... INSTALL Jamroot LICENSE_1_0.txt README.md b2 boost boost-build.jam boost.css boost.png boostcpp.jam bootstrap.bat bootstrap.log bootstrap.sh doc index.htm index.html libs more project-config.jam rst.css run_log.txt status tools user-config.jam
clang-linux.link.dll 
/tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/libboost_system.so.1.71.0



  link
  ---------


"clang++"   -o "/tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/libboost_system.so.1.71.0" 
-Wl,-soname -Wl,libboost_system.so.1.71.0 -shared -Wl,--start-group 
"/tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/error_code.o"  
-Wl,-Bstatic  -Wl,-Bdynamic  -Wl,--end-group -fPIC -fvisibility=hidden -fvisibility-inlines-hidden 

CXX PARAMS -in- = -o /tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/libboost_system.so.1.71.0 
-Wl,-soname -Wl,libboost_system.so.1.71.0 -shared -Wl,--start-group 
/tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/error_code.o 
-Wl,-Bstatic -Wl,-Bdynamic -Wl,--end-group -fPIC -fvisibility=hidden -fvisibility-inlines-hidden  
.......................................... INSTALL Jamroot LICENSE_1_0.txt README.md b2 boost boost-build.jam boost.css boost.png boostcpp.jam bootstrap.bat bootstrap.log bootstrap.sh doc index.htm index.html libs more project-config.jam rst.css run_log.txt status tools user-config.jam


CXX PARAMS --passed-- =  -fno-integrated-as -fPIC   -L/home/declan/zone/low/boost/Boost-for-Android/down/ndk/20/sources/crystax/libs/arm64-v8a   
-o /tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/libboost_system.so.1.71.0 
-Wl,-soname -Wl,libboost_system.so -shared -Wl,--start-group 
/tmp/ndk-declan/tmp/build-104644/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/error_code.o 
-Wl,-Bstatic -Wl,-Bdynamic -Wl,--end-group -fPIC -fvisibility=hidden -fvisibility-inlines-hidden  
.......................................... INSTALL Jamroot LICENSE_1_0.txt README.md b2 boost boost-build.jam boost.css boost.png boostcpp.jam bootstrap.bat bootstrap.log bootstrap.sh doc index.htm index.html libs more project-config.jam rst.css run_log.txt status tools user-config.jam









 
---------------------------------------------------------

arm64-v8a:
-----------
-----------

 
 "clang++"   -o "/tmp/ndk-declan/tmp/build-8772/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/chrono/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/libboost_chrono.so.1.69.0" 
 
 -Wl,-soname -Wl,libboost_chrono.so.1.69.0 -shared -Wl,--start-group
 
 "/tmp/ndk-declan/tmp/build-8772/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/chrono/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/chrono.o" "/tmp/ndk-declan/tmp/build-8772/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/chrono/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/thread_clock.o" "/tmp/ndk-declan/tmp/build-8772/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/chrono/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/process_cpu_clocks.o" "/tmp/ndk-declan/tmp/build-8772/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/libboost_system.so.1.69.0" 
 
 -Wl,-Bstatic  -Wl,-Bdynamic  -Wl,--end-group -fPIC -fvisibility=hidden -fvisibility-inlines-hidden 
 

 ----------------------------------------------------
 "clang++" -c -x c++ -fvisibility-inlines-hidden -fPIC -O3 -Wall -fvisibility=hidden -Wno-inline
 --------------------------------------------------------------
    "clang++"   -o "/tmp/ndk-declan/tmp/build-8772/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/libboost_system.so.1.69.0" 
    
    -Wl,-soname -Wl,libboost_system.so.1.69.0 -shared -Wl,--start-group
    
    "/tmp/ndk-declan/tmp/build-8772/build-boost/arm64-v8a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm64/release/target-os-android/threading-multi/visibility-hidden/error_code.o" 
    
    -Wl,-Bstatic  -Wl,-Bdynamic  -Wl,--end-group -fPIC -fvisibility=hidden -fvisibility-inlines-hidden 

-----------------------------------------------------

"clang++" -c -x c++ -fvisibility-inlines-hidden -fPIC -O3 -Wall -fvisibility=hidden -Wno-inline -Wextra -Wno-long-long -Wno-variadic-macros -pedantic 

 ---------------------------------------------------
 
 FLAGS =  -fno-integrated-as  -fPIC 
 

 
 <compileflags>-fPIC
<compileflags>-ffunction-sections
<compileflags>-fdata-sections
<compileflags>-funwind-tables
<compileflags>-fstack-protector-strong
<compileflags>-no-canonical-prefixes
<compileflags>-Wformat
<compileflags>-Werror=format-security
<compileflags>-frtti
<compileflags>-fexceptions
<compileflags>-DNDEBUG
<compileflags>-g
<compileflags>-Oz


 
 

armeabi-v7a
-----------
-----------

 
  "clang++" -c -x c++ -fvisibility-inlines-hidden -fPIC -O3 -Wall -fvisibility=hidden -Wno-inline  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DNDEBUG -I"." -o "/tmp/ndk-declan/tmp/build-7672/build-boost/armeabi-v7a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm/release/target-os-android/threading-multi/visibility-hidden/error_code.o" "libs/system/src/error_code.cpp"
 -------------------------------------------------------

 
     "clang++"   -o "/tmp/ndk-declan/tmp/build-7672/build-boost/armeabi-v7a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm/release/target-os-android/threading-multi/visibility-hidden/libboost_system.so.1.69.0" -Wl,-soname -Wl,libboost_system.so.1.69.0 -shared -Wl,--start-group "/tmp/ndk-declan/tmp/build-7672/build-boost/armeabi-v7a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm/release/target-os-android/threading-multi/visibility-hidden/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic  -Wl,--end-group -fPIC -fvisibility=hidden -fvisibility-inlines-hidden 
 -------------------------------------------------------

 
 "clang++" -c -x c++ -fvisibility-inlines-hidden -fPIC -O3 -Wall -fvisibility=hidden -Wno-inline -Wextra -Wno-long-long -Wno-variadic-macros -pedantic -DBOOST_ALL_DYN_LINK=1 -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DNDEBUG -I"." -o "/tmp/ndk-declan/tmp/build-7672/build-boost/armeabi-v7a/llvm/build/boost/bin.v2/libs/chrono/build/clang-linux-arm/release/target-os-android/threading-multi/visibility-hidden/thread_clock.o" "libs/chrono/src/thread_clock.cpp"
 
 
 -------------------------------------------------------
    "clang++"   -o "/tmp/ndk-declan/tmp/build-7672/build-boost/armeabi-v7a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm/release/target-os-android/threading-multi/visibility-hidden/libboost_system.so.1.69.0" -Wl,-soname -Wl,libboost_system.so.1.69.0 -shared -Wl,--start-group "/tmp/ndk-declan/tmp/build-7672/build-boost/armeabi-v7a/llvm/build/boost/bin.v2/libs/system/build/clang-linux-arm/release/target-os-android/threading-multi/visibility-hidden/error_code.o"  -Wl,-Bstatic  -Wl,-Bdynamic  -Wl,--end-group -fPIC -fvisibility=hidden -fvisibility-inlines-hidden 
 
 
 -------------------------------------------------------

 
 FLAGS = -fno-integrated-as  -fPIC       -march=armv7-a -mfpu=vfpv3-d16 -mfloat-abi=softfp -Wl,--fix-cortex-a8 
 
 
