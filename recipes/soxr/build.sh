 #!/bin/sh

mkdir build
cd build

cmake ${CMAKE_ARGS} -GNinja .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTS=ON

cmake --build . --config Release
cmake --build . --config Release --target install
ctest --output-on-failure -C Release -E "misc::check_license"
