# export CUDA_HOME=/usr/local/cuda-12.5 
# export NVSHMEM_SHMEM_SUPPORT=0 
# export NVSHMEM_UCX_SUPPORT=0 
# export NVSHMEM_USE_NCCL=0 
# export NVSHMEM_MPI_SUPPORT=0 
# export NVSHMEM_IBGDA_SUPPORT=0
# export NVSHMEM_PMIX_SUPPORT=0 
# export NVSHMEM_TIMEOUT_DEVICE_POLLING=0 
# export NVSHMEM_USE_GDRCOPY=0 

# cmake -S . -B build/ -DCMAKE_INSTALL_PREFIX=

# cd build
# make -j$(nproc)
# make install


export NVSHMEM_DIR=/home/dhruvgu2/llm_sys_DeepEP 
export DISABLE_AGGRESSIVE_PTX_INSTRS=1
cd /home/dhruvgu2/llm_sys_DeepEP/
python setup.py build

rm -f deep_ep_cpp.cpython-38-x86_64-linux-gnu.so

ln -s build/lib.linux-x86_64-cpython-38/deep_ep_cpp.cpython-38-x86_64-linux-gnu.so

python setup.py install