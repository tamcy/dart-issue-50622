Dart Issue #50622
=================

## Running the code
```
$ docker build . -t dart_issue_repro
$ docker run dart_issue_repro
```

## The problem

When running on Docker, the following crash message is emitted in the middle of the loop:

```
===== CRASH =====
si_signo=Trace/breakpoint trap(5), si_code=128, si_addr=(nil)
version=2.19.0-374.2.beta (beta) (Wed Nov 23 12:15:38 2022 +0000) on "linux_x64"
pid=1, thread=16, isolate_group=main(0x55b312372000), isolate=main(0x55b312465000)
os=linux, arch=x64, comp=no, sim=no
isolate_instructions=55b30fb16360, vm_instructions=55b30fb16360
  pc 0x00007fde15b4d947 fp 0x00007fde1137e050 Unknown symbol
  pc 0x00007fde15b38ad8 fp 0x00007fde1137e0e8 Unknown symbol
  pc 0x00007fde15b37e5b fp 0x00007fde1137e178 Unknown symbol
  pc 0x00007fde15b2d9af fp 0x00007fde1137e1e8 Unknown symbol
  pc 0x00007fde15b2d7f7 fp 0x00007fde1137e260 Unknown symbol
  pc 0x00007fde15b2d34c fp 0x00007fde1137e2c0 Unknown symbol
  pc 0x00007fde15b2c32b fp 0x00007fde1137e310 Unknown symbol
  pc 0x00007fde15b23dd2 fp 0x00007fde1137e350 Unknown symbol
  pc 0x00007fde15b23c0c fp 0x00007fde1137e380 Unknown symbol
  pc 0x00007fde15b22d9f fp 0x00007fde1137e3e8 Unknown symbol
  pc 0x00007fde15b2303b fp 0x00007fde1137e428 Unknown symbol
  pc 0x00007fde15b22d9f fp 0x00007fde1137e490 Unknown symbol
  pc 0x00007fde15b225e1 fp 0x00007fde1137e4e8 Unknown symbol
  pc 0x00007fde1c402ffc fp 0x00007fde1137e560 Unknown symbol
  pc 0x000055b30fc8a949 fp 0x00007fde1137e600 dart::DartEntry::InvokeCode(dart::Code const&, unsigned long, dart::Array const&, dart::Array const&, dart::Thread*)+0x139
  pc 0x000055b30fc8a7c5 fp 0x00007fde1137e660 dart::DartEntry::InvokeFunction(dart::Function const&, dart::Array const&, dart::Array const&, unsigned long)+0x145
  pc 0x000055b30fc8cb24 fp 0x00007fde1137e6a0 dart::DartLibraryCalls::HandleMessage(long, dart::Instance const&)+0x144
  pc 0x000055b30fcafe58 fp 0x00007fde1137ec30 dart::IsolateMessageHandler::HandleMessage(std::__2::unique_ptr<dart::Message, std::__2::default_delete<dart::Message>>)+0x348
  pc 0x000055b30fcd808a fp 0x00007fde1137ecb0 dart::MessageHandler::HandleMessages(dart::MonitorLocker*, bool, bool)+0x15a
  pc 0x000055b30fcd87ab fp 0x00007fde1137ed00 dart::MessageHandler::TaskCallback()+0x1db
  pc 0x000055b30fdfdb9b fp 0x00007fde1137ed80 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)+0x13b
  pc 0x000055b30fdfdfe8 fp 0x00007fde1137edb0 dart::ThreadPool::Worker::Main(unsigned long)+0x78
  pc 0x000055b30fd74906 fp 0x00007fde1137ee70 dart+0x21b4906
-- End of DumpStackTrace
```

When running on Windows in Debug mode, the code terminates with exit code -2147483645. No error
message is printed. Occasionally a message similar to the following is emitted:

```
Error: Failed to send request: {"jsonrpc":"2.0","id":"9","method":"setExceptionPauseMode","params":{"isolateId":"isolates/3021199231267163","mode":"Unhandled"}}
```

*(I counter the message just once in tens of the executions.)*

## Tested versions

**Crash**

* dart:2.19.0-374.2.beta
* dart:2.19.0-374.1.beta
* dart:2.19.0-255.2.beta
* dart:2.19.0-146.1.beta

**No crash**

* dart:2.18.5 
