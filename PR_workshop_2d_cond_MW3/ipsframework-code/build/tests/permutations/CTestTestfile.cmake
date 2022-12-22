# CMake generated Testfile for 
# Source directory: /home/dsamadd/ipsframework-code/tests/permutations
# Build directory: /home/dsamadd/ipsframework-code/build/tests/permutations
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(permutations-setup_test.sh "setup_test.sh")
ADD_TEST(permutations-test_ips.sh "test_ips.sh")
ADD_TEST(permutations-test_ips.py "python" "test_ips.py")
