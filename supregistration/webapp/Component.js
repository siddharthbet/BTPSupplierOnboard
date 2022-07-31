sap.ui.define([
        "sap/ui/core/UIComponent",
        "sap/ui/Device",
        "com/hv/supregistration/model/models"
    ],
    function (UIComponent, Device, models) {
        "use strict";

        return UIComponent.extend("com.hv.supregistration.Component", {
            metadata: {
                manifest: "json"
            },

            /**
             * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
             * @public
             * @override
             */
            init: function () {
                // call the base component's init function
                UIComponent.prototype.init.apply(this, arguments);

                // enable routing
                this.getRouter().initialize();

                // set the device model
                this.setModel(models.createDeviceModel(), "device");

                var jModel = new sap.ui.model.json.JSONModel();
                this.setModel(jModel, "suppModel");

                //ChatBot plugin
                this.callBot(); 
            },

            callBot: function() {
                if (!document.getElementById("cai-webchat")) {
                    var s = document.createElement("script");
                    s.setAttribute("id", "cai-webchat");
                    s.setAttribute("src", "https://cdn.cai.tools.sap/webchat/webchat.js");
                    document.body.appendChild(s);
                }
                s.setAttribute("channelId", "f34f36bf-cfe5-48c4-8d00-0b1afaab15e0");
                s.setAttribute("token", "f87a82e4dc13a2150bdad84a150059c7");
            }
        });
    }
);