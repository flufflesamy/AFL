# Status Monitor Framework

Any item can be made into a Status Monitor by adding properties into the `CfgWeapons`
class of your addon's `config.cpp` file.

## Adding a Status Monitor

To add a regular status monitor, set the property `AFL_isMonitor = 1`. To add a TL status monitor,
set the property `AFL_isMonitor = 2`.

~~~admonish example
The following code adds status monitor functionality to an item:

```cpp
// File: config.cpp

class CfgWeapons {
    // Your item class
    class My_Item : CBA_MiscItem {
      // Where 1 = Regular, 2 = TL
      AFL_isMonitor = 1;

      // Rest of your code
      // ...
    };
};
```
~~~
