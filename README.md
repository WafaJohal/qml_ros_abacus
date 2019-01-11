

Requirements
------------

- `qt5`
- ROS (tested with ROS melodic)
- ros-qml-plugin from [https://github.com/severin-lemaignan/ros-qml-plugin]
- Box2D from https://github.com/qml-box2d/qml-box2d

Installation
------------

The following commands compile and install the QML plugin in the QML dir,
making it available to any QML application.

```
> mkdir build
> cd build
> [path to your Qt_install/../gcc_64/bin/]qmake ..
> make
> make install
```

### Known Issue

ROS has a known error in its `pkgconfig` files (`.pc`) as libs dependencies are
specified as `-l:/path/libname.so`: `-l:` should be removed. This can be done by
updating the `.pc` files in ROS:

```
> cd /opt/ros/kinetic/lib/pkgconfig/
> sudo sed -i "s/-l://g" *
```



### send topic on bead : 

```
 rostopic pub -1abacus/row1/bead4/setX std_msgs/String \"600\"
```
