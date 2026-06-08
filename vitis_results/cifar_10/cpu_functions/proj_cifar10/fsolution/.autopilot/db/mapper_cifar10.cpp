#include "hls_signal_handler.h"
#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_directio.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
using hls::sim::Byte;
extern "C" void cifar10(Byte<4>*, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int);
extern "C" void apatb_cifar10_hw(volatile void * __xlx_apatb_param_output_data, volatile void * __xlx_apatb_param_conv_1_output, volatile void * __xlx_apatb_param_pooling_1_output, volatile void * __xlx_apatb_param_conv_2_output, volatile void * __xlx_apatb_param_pooling_2_output, volatile void * __xlx_apatb_param_dense_layer_1_output, volatile void * __xlx_apatb_param_dense_layer_2_output, volatile void * __xlx_apatb_param_input_data, volatile void * __xlx_apatb_param_kernel_1_data, volatile void * __xlx_apatb_param_kernel_2_data, volatile void * __xlx_apatb_param_weights_1, volatile void * __xlx_apatb_param_weights_2, int __xlx_apatb_param_input_data_size, int __xlx_apatb_param_output_data_size, int __xlx_apatb_param_kernel_1_size, int __xlx_apatb_param_kernel_2_size, int __xlx_apatb_param_stride_1_size, int __xlx_apatb_param_stride_2_size, int __xlx_apatb_param_neurons_dense_1_size, int __xlx_apatb_param_neurons_dense_2_size) {
using hls::sim::createStream;
  // Collect __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec
std::vector<Byte<4>> __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_output_data)[i]);
}
  int __xlx_size_param_output_data = 1;
  int __xlx_offset_param_output_data = 0;
  int __xlx_offset_byte_param_output_data = 0*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv_1_output)[i]);
}
  int __xlx_size_param_conv_1_output = 1;
  int __xlx_offset_param_conv_1_output = 1;
  int __xlx_offset_byte_param_conv_1_output = 1*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_pooling_1_output)[i]);
}
  int __xlx_size_param_pooling_1_output = 1;
  int __xlx_offset_param_pooling_1_output = 2;
  int __xlx_offset_byte_param_pooling_1_output = 2*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv_2_output)[i]);
}
  int __xlx_size_param_conv_2_output = 1;
  int __xlx_offset_param_conv_2_output = 3;
  int __xlx_offset_byte_param_conv_2_output = 3*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_pooling_2_output)[i]);
}
  int __xlx_size_param_pooling_2_output = 1;
  int __xlx_offset_param_pooling_2_output = 4;
  int __xlx_offset_byte_param_pooling_2_output = 4*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_dense_layer_1_output)[i]);
}
  int __xlx_size_param_dense_layer_1_output = 1;
  int __xlx_offset_param_dense_layer_1_output = 5;
  int __xlx_offset_byte_param_dense_layer_1_output = 5*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_dense_layer_2_output)[i]);
}
  int __xlx_size_param_dense_layer_2_output = 1;
  int __xlx_offset_param_dense_layer_2_output = 6;
  int __xlx_offset_byte_param_dense_layer_2_output = 6*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_input_data)[i]);
}
  int __xlx_size_param_input_data = 1;
  int __xlx_offset_param_input_data = 7;
  int __xlx_offset_byte_param_input_data = 7*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_kernel_1_data)[i]);
}
  int __xlx_size_param_kernel_1_data = 1;
  int __xlx_offset_param_kernel_1_data = 8;
  int __xlx_offset_byte_param_kernel_1_data = 8*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_kernel_2_data)[i]);
}
  int __xlx_size_param_kernel_2_data = 1;
  int __xlx_offset_param_kernel_2_data = 9;
  int __xlx_offset_byte_param_kernel_2_data = 9*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_1)[i]);
}
  int __xlx_size_param_weights_1 = 1;
  int __xlx_offset_param_weights_1 = 10;
  int __xlx_offset_byte_param_weights_1 = 10*4;
for (size_t i = 0; i < 1; ++i){
__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_2)[i]);
}
  int __xlx_size_param_weights_2 = 1;
  int __xlx_offset_param_weights_2 = 11;
  int __xlx_offset_byte_param_weights_2 = 11*4;
  // DUT call
  cifar10(__xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec.data(), __xlx_offset_byte_param_output_data, __xlx_offset_byte_param_conv_1_output, __xlx_offset_byte_param_pooling_1_output, __xlx_offset_byte_param_conv_2_output, __xlx_offset_byte_param_pooling_2_output, __xlx_offset_byte_param_dense_layer_1_output, __xlx_offset_byte_param_dense_layer_2_output, __xlx_offset_byte_param_input_data, __xlx_offset_byte_param_kernel_1_data, __xlx_offset_byte_param_kernel_2_data, __xlx_offset_byte_param_weights_1, __xlx_offset_byte_param_weights_2, __xlx_apatb_param_input_data_size, __xlx_apatb_param_output_data_size, __xlx_apatb_param_kernel_1_size, __xlx_apatb_param_kernel_2_size, __xlx_apatb_param_stride_1_size, __xlx_apatb_param_stride_2_size, __xlx_apatb_param_neurons_dense_1_size, __xlx_apatb_param_neurons_dense_2_size);
// print __xlx_apatb_param_output_data
for (size_t i = 0; i < __xlx_size_param_output_data; ++i) {
((Byte<4>*)__xlx_apatb_param_output_data)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_output_data+i];
}
// print __xlx_apatb_param_conv_1_output
for (size_t i = 0; i < __xlx_size_param_conv_1_output; ++i) {
((Byte<4>*)__xlx_apatb_param_conv_1_output)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_conv_1_output+i];
}
// print __xlx_apatb_param_pooling_1_output
for (size_t i = 0; i < __xlx_size_param_pooling_1_output; ++i) {
((Byte<4>*)__xlx_apatb_param_pooling_1_output)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_pooling_1_output+i];
}
// print __xlx_apatb_param_conv_2_output
for (size_t i = 0; i < __xlx_size_param_conv_2_output; ++i) {
((Byte<4>*)__xlx_apatb_param_conv_2_output)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_conv_2_output+i];
}
// print __xlx_apatb_param_pooling_2_output
for (size_t i = 0; i < __xlx_size_param_pooling_2_output; ++i) {
((Byte<4>*)__xlx_apatb_param_pooling_2_output)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_pooling_2_output+i];
}
// print __xlx_apatb_param_dense_layer_1_output
for (size_t i = 0; i < __xlx_size_param_dense_layer_1_output; ++i) {
((Byte<4>*)__xlx_apatb_param_dense_layer_1_output)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_dense_layer_1_output+i];
}
// print __xlx_apatb_param_dense_layer_2_output
for (size_t i = 0; i < __xlx_size_param_dense_layer_2_output; ++i) {
((Byte<4>*)__xlx_apatb_param_dense_layer_2_output)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_dense_layer_2_output+i];
}
// print __xlx_apatb_param_input_data
for (size_t i = 0; i < __xlx_size_param_input_data; ++i) {
((Byte<4>*)__xlx_apatb_param_input_data)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_input_data+i];
}
// print __xlx_apatb_param_kernel_1_data
for (size_t i = 0; i < __xlx_size_param_kernel_1_data; ++i) {
((Byte<4>*)__xlx_apatb_param_kernel_1_data)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_kernel_1_data+i];
}
// print __xlx_apatb_param_kernel_2_data
for (size_t i = 0; i < __xlx_size_param_kernel_2_data; ++i) {
((Byte<4>*)__xlx_apatb_param_kernel_2_data)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_kernel_2_data+i];
}
// print __xlx_apatb_param_weights_1
for (size_t i = 0; i < __xlx_size_param_weights_1; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_1)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_weights_1+i];
}
// print __xlx_apatb_param_weights_2
for (size_t i = 0; i < __xlx_size_param_weights_2; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_2)[i] = __xlx_output_data_conv_1_output_pooling_1_output_conv_2_output_pooling_2_output_dense_layer_1_output_dense_layer_2_output_input_data_kernel_1_data_kernel_2_data_weights_1_weights_2__tmp_vec[__xlx_offset_param_weights_2+i];
}
}
