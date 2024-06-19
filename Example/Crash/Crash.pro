QT = core
QT += network

CONFIG += c++17 cmdline thread exceptions rtti stl

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# 配置qBreakPad头文件和链接库路径
win32:CONFIG(release, debug|release): {
    LIBS += -L$$PWD/qbreakpadlib/lib/release/ -lqBreakpad
    DEPENDPATH += $$PWD/qbreakpadlib/lib/release
}
else:win32:CONFIG(debug, debug|release): {
    LIBS += -L$$PWD/qbreakpadlib/lib/debug/ -lqBreakpad
    DEPENDPATH += $$PWD/qbreakpadlib/lib/debug
}
INCLUDEPATH += $$PWD/qbreakpadlib/include

# 设置release模式生成调试信息（MSVC:xx.pdb, *nix/mingw:带调试信息的exe）
win32-msvc* {
    QMAKE_LFLAGS_RELEASE += /MAP
    QMAKE_CFLAGS_RELEASE += /Zi
    QMAKE_LFLAGS_RELEASE += /debug /opt:ref
}
* {
    QMAKE_CFLAGS_RELEASE += -g
    QMAKE_CXXFLAGS_RELEASE += -g
    QMAKE_CFLAGS_RELEASE -= -O2
    QMAKE_CXXFLAGS_RELEASE -= -O2
    QMAKE_LFLAGS_RELEASE = -mthreads -W
}
QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO
QMAKE_LFLAGS_RELEASE += $$QMAKE_LFLAGS_RELEASE_WITH_DEBUGINFO

SOURCES += \
        main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
