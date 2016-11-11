## About
QML user interface for farbsort showcase.

## Usage

### Checkout

    git clone https://github.com/bbvch/farbsort-gui.git

### Build

    mkdir build && cd build
    qmake ../farbsort-gui
    make

### Run

Start [farbsort-websocket](https://github.com/bbvch/farbsort-websocket) service on beaglebone black. 

    ./farbsort-gui -i WEBSOCKET_HOST_IP
