cmake_minimum_required(VERSION 3.16)
project(rtklib_2_4_2)

set(CMAKE_CXX_STANDARD 14)

include_directories(app/appcmn)
include_directories(app/rtkconv)
include_directories(app/rtkget)
include_directories(app/rnx2rtkp)
include_directories(app/rtklaunch)
include_directories(app/rtknavi)
include_directories(app/rtkplot)
include_directories(app/rtkpost)
include_directories(app/srctblbrows)
include_directories(app/strsvr)
include_directories(lib/iers/src_c)
include_directories(src)

add_executable(rtklib_2_4_2
        app/rnx2rtkp/rnx2rtkp.c
        src/postpos.c
        src/rtkcmn.c
        src/options.c
        src/solution.c
        src/sbas.c
        src/qzslex.c
        src/rtcm.c
        src/rtcm2.c
        src/rtcm3.c
        src/rtcm3e.c
        src/rtkpos.c
        src/preceph.c
        src/rinex.c
        src/pntpos.c
        src/ionex.c
        src/geoid.c
        src/ppp.c
        src/ppp_ar.c
        src/ephemeris.c
        src/rtkpos.c
        src/lambda.c
        )

target_link_libraries(rtklib_2_4_2 winmm)