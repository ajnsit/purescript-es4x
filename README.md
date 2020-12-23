# purescript-es4x
[ES4X](https://github.com/reactiverse/es4x) bindings for Purescript. For building blazing fast web backends.

## Usage

#### Optional - install GraalVM

You can use either stock JDK, or GraalVM with this. If using GraalVM, the easiest way is to use [Jabba](https://github.com/shyiko/jabba).

#### Clone this repo and cd into it.

```
git clone https://github.com/ajnsit/purescript-es4x
cd purescript-es4x
```

#### Build and run this code -

```
npm install
npx spago build
npm start
```

## Performance

First impressions of es4x are very positive! My rudimentry and totally unscientific benchmark results for hello world apps in (Purescript+Node), (Purescript+ES4X), and (Haskell+Wai) are below -

**PURESCRIPT NODE - ~11K req/sec**

```
➜  ~ wrk -t2 -c100 -d1m -R140000 http://127.0.0.1:8080
Running 1m test @ http://127.0.0.1:8080
  2 threads and 100 connections
  Thread calibration: mean lat.: 4963.568ms, rate sampling interval: 16941ms
  Thread calibration: mean lat.: 4963.356ms, rate sampling interval: 16941ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    32.18s    13.56s    0.92m    56.37%
    Req/Sec     5.36k   252.00     5.61k    50.00%
  647384 requests in 1.00m, 148.17MB read
Requests/sec:  10789.76
Transfer/sec:      2.47MB
```

**HASKELL WAI - ~120K requests/sec**

```
➜  ~ wrk -t2 -c100 -d1m -R140000 http://127.0.0.1:8080
Running 1m test @ http://127.0.0.1:8080
  2 threads and 100 connections
  Thread calibration: mean lat.: 878.842ms, rate sampling interval: 2885ms
  Thread calibration: mean lat.: 878.826ms, rate sampling interval: 2885ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     5.02s     1.86s    8.56s    59.83%
    Req/Sec    60.48k     1.47k   61.61k    82.35%
  7187914 requests in 1.00m, 1.15GB read
Requests/sec: 119799.19
Transfer/sec:     19.65MB
```

**PURESCRIPT ES4X - ~140K requests/sec**

```
➜  ~ wrk -t2 -c100 -d1m -R140000 http://127.0.0.1:3000
Running 1m test @ http://127.0.0.1:3000
  2 threads and 100 connections
  Thread calibration: mean lat.: 1109.463ms, rate sampling interval: 2557ms
  Thread calibration: mean lat.: 1108.048ms, rate sampling interval: 2555ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   436.74ms  457.79ms   1.46s    77.52%
    Req/Sec    71.49k     2.84k   75.28k    73.68%
  8382538 requests in 1.00m, 415.70MB read
Requests/sec: 139709.57
Transfer/sec:      6.93MB
```

