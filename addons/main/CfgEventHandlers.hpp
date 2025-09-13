class Extended_PreInit_EventHandlers {
    class ADDON {
        // This will be executed once in 3DEN, main menu and before briefing has started for every mission
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
