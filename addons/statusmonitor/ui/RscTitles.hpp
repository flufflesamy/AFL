class RscTitles {
    class GVAR(RscStatusMonitor) {
        idd = IDD_STATUS_MONITOR;
        duration = 1e+6;
        fadeIn = 0;
        fadeOut = 0;
        onLoad = QUOTE(_this select 0 call FUNC(ui_onMonitorShow));

        class Controls {
            class Entries : GVAR(RscEntries) {};
        };
    };
};
