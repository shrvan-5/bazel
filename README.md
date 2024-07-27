sudo docker build -t bazel-cpp-build .
========================================
sudo docker run --rm -it bazel-cpp-build
========================================
mount a volume: sudo docker run --rm -it -v $(pwd)/output:/usr/src/app/bazel-bin bazel-cpp-build
=================================================================================================
sudo docker run --rm -it bazel-cpp-build /bin/bash (interactively)
==================================================================
