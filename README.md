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

#### Real target

Start [farbsort-websocket](https://github.com/bbvch/farbsort-websocket) service on beaglebone black. 

    ./farbsort-gui --ip-address WEBSOCKET_HOST_IP


#### Simulated target

    ./farbsort-gui --simulation
